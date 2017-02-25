import praw
import indicoio
from decimal import *
from datetime import datetime, timedelta
from scipy import spatial
from celery.task import periodic_task
from functools import wraps
from django.utils import timezone

from memex.celeryconf import app
from memes.models import Meme, MemeFile
from .models import RedditPost, RedditPostSnapshot
from utils.imageLibrary import parse_reddit_url, generate_probabilities

client_id = 'B1qHlERNKwBQyQ'
client_secret = 'syiqQ-fJQakz3f7p7rYiVVcnWYM'
user_agent = 'PyEng MemeMarket Bot 0.1'


@periodic_task(run_every=timedelta(minutes=2))
def get_hot_submissions_advice_animals():
    reddit = praw.Reddit(client_id=client_id, client_secret=client_secret, user_agent=user_agent)
    sub = "adviceanimals"
    subreddit = reddit.subreddit(sub)
    print('Pulling data from {0}'.format(sub))
    count = 0
    for submission in subreddit.hot(limit=100):
        count += 1
        if not (submission.stickied):
            try:
                print('{0}.Processing post: {1}'.format(count, submission.id))
                post = RedditPost.objects.filter(submission_id=submission.id)
                if (post.__len__() > 0):
                    post = post[0]
                else:
                    meme_url = parse_reddit_url(submission.url)
                    result = generate_probabilities(meme_url)
                    closest_image = max(result, key=lambda i: result[i])
                    meme_file = MemeFile.objects.get(filename=closest_image)
                    likely_meme = meme_file.meme
                    post = RedditPost(
                        submission_id=submission.id,
                        closest_image=meme_file,
                        likely_meme=likely_meme,
                        image_similarity=Decimal(result[closest_image]),
                        image_url=submission.url,
                        title=str(submission.title),
                        subreddit=str(submission.subreddit),
                        subreddit_id=str(submission.subreddit_id),
                        permalink=str(submission.permalink),
                        submission_created=datetime.utcfromtimestamp(submission.created),
                        author=str(submission.author),
                    )
                    post.save()

                snapshot = RedditPostSnapshot(
                    reddit_post=post,
                    date_crawled=timezone.now(),
                    score=int(submission.score),
                    gilded=str(submission.gilded)
                )
                snapshot.save()

            except Exception as e:
                print("ERRUH " + str(e) + " : " + str(submission.title))

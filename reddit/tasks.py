import praw
import indicoio
from datetime import datetime, timedelta
from scipy import spatial
from utils.imageLibrary import parse_reddit_url, generate_probabilities
from .models import RedditPost, RedditPostSnapshot
from functools import wraps
from celery.task import periodic_task

from memex.celeryconf import app

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
                    likely_meme = max(result, key=lambda i: result[i])
                    post = RedditPost(
                        submission_id=submission.id,
                        likely_meme=str(likely_meme),
                        image_similarity=str(result[likely_meme]),
                        image_url=str(submission.url),
                        title=str(submission.title),
                        subreddit=str(submission.subreddit),
                        subreddit_id=str(submission.subreddit_id),
                        permalink=str(submission.permalink),
                        submission_created=str(submission.created),
                        author=str(submission.author),
                    )
                    post.save()

                snapshot = RedditPostSnapshot(
                    reddit_post=post,
                    date_crawled=str(datetime.now()),
                    score=str(submission.score),
                    gilded=str(submission.gilded)
                )
                snapshot.save()

            except Exception as e:
                print("ERRUH " + str(e) + " : " + str(submission.title))

import praw
import indicoio
from datetime import datetime
from scipy import spatial
from .imageLibrary import parse_reddit_url, generate_probabilities
from memex.celeryconf import app
from .models import RedditPost
from functools import wraps

client_id = 'B1qHlERNKwBQyQ'
client_secret = 'syiqQ-fJQakz3f7p7rYiVVcnWYM'
user_agent = 'PyEng MemeMarket Bot 0.1'


@app.task
def get_latest_30_advice_animals():
    reddit = praw.Reddit(client_id=client_id, client_secret=client_secret, user_agent=user_agent)
    subreddit = reddit.subreddit("adviceanimals")
    for submission in subreddit.hot(limit=30):
        if not (submission.stickied):
            print (submission.title)
            try:
                meme_url = parse_reddit_url(submission.url)
                result = generate_probabilities(meme_url)
                likely_meme = max(result, key=lambda i: result[i])
                post = RedditPost(
                    submission_id=str(submission.id),
                    likely_meme=str(likely_meme),
                    image_similarity=str(result[likely_meme]),
                    image_url=str(submission.url),
                    gilded=str(submission.gilded),
                    score=str(submission.score),
                    title=str(submission.title),
                    subreddit=str(submission.subreddit),
                    subreddit_id=str(submission.subreddit_id),
                    permalink=str(submission.permalink),
                    submission_created=str(submission.created),
                    date_crawled=str(datetime.now()),
                    author=str(submission.author),
                )
                post.save()
            except Exception as e:
                print ("ERRUH " + str(e) + " : " + str(submission.title))

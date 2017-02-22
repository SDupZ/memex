import praw
import indicoio
from datetime import datetime
from scipy import spatial
from .imageLibrary import parse_reddit_url, generate_probabilities
from .models import RedditPost, RedditPostSnapshot
from functools import wraps

from memex.celeryconf import app

client_id = 'B1qHlERNKwBQyQ'
client_secret = 'syiqQ-fJQakz3f7p7rYiVVcnWYM'
user_agent = 'PyEng MemeMarket Bot 0.1'


# @app.on_after_configure.connect
# def setup_periodic_tasks(sender, **kwargs):
#     sender.add_periodic_task(10.0, test.s('hello'), name='add every 10')
#
#
# @app.task
# def test(arg):
#     print(arg)


# @app.on_after_configure.connect
# def setup_periodic_tasks(sender, **kwargs):
#     sender.add_periodic_task(10.0, get_hot_submissions_advice_animals.s(), name='Hot 100 every 10 minutes')


@app.task
def get_hot_submissions_advice_animals():
    reddit = praw.Reddit(client_id=client_id, client_secret=client_secret, user_agent=user_agent)
    sub = "adviceanimals"
    subreddit = reddit.subreddit(sub)
    print('Pulling data from {0}'.format(sub))
    for submission in subreddit.hot(limit=100):
        if not (submission.stickied):
            try:
                print('Processing post: {0}'.format(submission.id))
                post = RedditPost.objects.filter(submission_id=submission.id)
                if (post.__len__() > 0):
                    post = post[0]
                else:
                    meme_url = parse_reddit_url(submission.url)
                    result = generate_probabilities(meme_url)
                    likely_meme = max(result, key=lambda i: result[i])
                    post = RedditPost(
                        submission_id=str(submission.id),
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

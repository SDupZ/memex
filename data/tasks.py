from decimal import *
from datetime import datetime, timedelta
from scipy import spatial
from celery.task import periodic_task
from django.utils import timezone

from memex.celeryconf import app
from memes.models import Meme
from reddit.models import RedditPost, RedditPostSnapshot
from data.models import MemeDataSnapshot24Hour, MemeDataSnapshot7Days, MemeDataSnapshot30Days


@periodic_task(run_every=timedelta(hours=2))
def update_all_memes_past_24_hours():
    memes = Meme.objects.all()
    results = []

    for meme in memes:

        reddit_posts_set = meme.redditpost_set.filter(submission_created__lte=datetime.now(), submission_created__gte=(datetime.now() - timedelta(days=1)))
        number_of_posts = len(reddit_posts_set)

        score = 0
        for post in reddit_posts_set:
            snapshots = post.reddit_post_snapshots.order_by('-date_crawled')
            if len(snapshots) > 0:
                score += snapshots[0].score

        snapshot = MemeDataSnapshot24Hour(
            meme=meme,
            crs_l24hrs=score,
            np_l24hrs=number_of_posts
        )

        try:
            snapshot.save()
        except Exception as e:
            print("Error saving Reddit Post " + str(e) + " : " + str(submission.title))


@periodic_task(run_every=timedelta(hours=24))
def update_all_memes_past_7_days():
    pass


@periodic_task(run_every=timedelta(minutes=24))
def update_all_memes_past_30_days():
    pass
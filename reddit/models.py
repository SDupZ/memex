from django.db import models
from memes.models import Meme, MemeFile


class RedditPost(models.Model):
    submission_id = models.CharField(db_index=True, unique=True, max_length=100)
    likely_meme = models.ForeignKey(Meme)
    closest_image = models.ForeignKey(MemeFile)
    image_similarity = models.DecimalField(decimal_places=4, max_digits=8)
    image_url = models.URLField()
    title = models.CharField(max_length=400)
    subreddit = models.CharField(max_length=100)
    subreddit_id = models.CharField(max_length=100)
    permalink = models.CharField(max_length=200)
    submission_created = models.DateTimeField()
    author = models.CharField(max_length=200)

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Reddit Post"
        ordering = ('submission_created',)


class RedditPostSnapshot(models.Model):
    reddit_post = models.ForeignKey(RedditPost, related_name="reddit_post_snapshots")
    date_crawled = models.DateTimeField()
    score = models.IntegerField()
    gilded = models.BooleanField(default=False)

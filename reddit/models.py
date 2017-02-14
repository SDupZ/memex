from django.db import models


class RedditPost(models.Model):
    submission_id = models.CharField(max_length=200)

    # TODO Foreign key reference to actual meme
    likely_meme = models.CharField(max_length=200)

    # image_similarity = models.DecimalField(decimal_places=4, max_digits=8)
    image_similarity = models.CharField(max_length=200)

    # image_url = models.URLField()
    image_url = models.CharField(max_length=200)

    gilded = models.BooleanField(default=False)

    # score = models.IntegerField()
    score = models.CharField(max_length=200)

    title = models.CharField(max_length=400)
    subreddit = models.CharField(max_length=200)
    subreddit_id = models.CharField(max_length=200)

    # permalink = models.URLField()
    permalink = models.CharField(max_length=200)

    # submission_created = models.DateTimeField()
    submission_created = models.CharField(max_length=200)

    # date_crawled = models.DateTimeField()
    date_crawled = models.CharField(max_length=200)

    author = models.CharField(max_length=200)

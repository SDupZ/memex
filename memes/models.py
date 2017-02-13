from django.db import models


class Job(models.Model):
    """Class describing a computational job"""

    # currently, available types of job are:
    TYPES = (
        ('fibonacci', 'fibonacci'),
        ('power', 'power'),
    )

    # list of statuses that job can have
    STATUSES = (
        ('pending', 'pending'),
        ('started', 'started'),
        ('finished', 'finished'),
        ('failed', 'failed'),
    )

    type = models.CharField(choices=TYPES, max_length=20)
    status = models.CharField(choices=STATUSES, max_length=20)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    argument = models.PositiveIntegerField()
    result = models.IntegerField(null=True)

    def save(self, *args, **kwargs):
        """Save model and if job is in pending state, schedule it"""
        super(Job, self).save(*args, **kwargs)
        if self.status == 'pending':
            from .tasks import TASK_MAPPING
            task = TASK_MAPPING[self.type]
            task.delay(job_id=self.id, n=self.argument)


class Meme(models.Model):
    name = models.CharField(max_length=100)


class RedditPost(models.Model):
    submission_id = models.CharField(max_length=20)

    # TODO Foreign key reference to actual meme
    likely_meme = models.CharField(max_length=50)

    image_similarity = models.DecimalField(decimal_places=4, max_digits=8)
    image_url = models.URLField()
    gilded = models.BooleanField(default=False)
    score = models.IntegerField()
    title = models.CharField(max_length=400)
    subreddit = models.CharField(max_length=50)
    subreddit_id = models.CharField(max_length=20)
    permalink = models.URLField()
    submission_created = models.DateTimeField()
    date_crawled = models.DateTimeField()
    author = models.CharField(max_length=50)

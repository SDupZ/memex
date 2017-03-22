from django.db import models
from memes.models import Meme
from reddit.models import RedditPost, RedditPostSnapshot
from utils.models import BaseModel


# Data for the last 24 hours
class MemeDataSnapshot24Hour(BaseModel):
    meme = models.ForeignKey(Meme)
    # Combined reddit score of the last 24 hours
    crs_l24hrs = models.IntegerField()
    # Number of posts on reddit in the last 24 hors
    np_l24hrs = models.IntegerField()

    def __str__(self):
        return self.meme.name

    class Meta:
        verbose_name = "Meme data snapshot 24 hour"


class MemeDataSnapshot7Days(BaseModel):
    meme = models.ForeignKey(Meme)
    crs_l7days = models.IntegerField()
    np_l7days = models.IntegerField()

    def __str__(self):
        return self.meme.name

    class Meta:
        verbose_name = "Meme data snapshot 7 days"


class MemeDataSnapshot30Days(BaseModel):
    meme = models.ForeignKey(Meme)
    crs_l30days = models.IntegerField()
    np_l30days = models.IntegerField()

    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.meme.name

    class Meta:
        verbose_name = "Meme data snapshot 30 days"


# TODO FUTURE: Store memesnapshotforparticularmonth

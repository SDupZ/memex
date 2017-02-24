from django.db import models


class Meme(models.Model):
    name = models.CharField(max_length=100)


class MemeFile(models.Model):
    meme = models.ForeignKey(Meme)
    filename = models.CharField(max_length=255)

from django.db import models


class Meme(models.Model):
    name = models.CharField(max_length=100)

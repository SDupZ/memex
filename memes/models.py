from django.db import models


class Meme(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = "Meme"
        ordering = ('name',)


class MemeFile(models.Model):
    meme = models.ForeignKey(Meme)
    filename = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.filename

    class Meta:
        verbose_name = "Meme Filename"

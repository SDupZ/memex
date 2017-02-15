# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-14 03:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reddit', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='redditpost',
            name='date_crawled',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='redditpost',
            name='image_similarity',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='redditpost',
            name='image_url',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='redditpost',
            name='permalink',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='redditpost',
            name='score',
            field=models.CharField(max_length=200),
        ),
        migrations.AlterField(
            model_name='redditpost',
            name='submission_created',
            field=models.CharField(max_length=200),
        ),
    ]
# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-13 22:57
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('memes', '0003_auto_20170213_2255'),
    ]

    operations = [
        migrations.AlterField(
            model_name='redditpost',
            name='subreddit_id',
            field=models.CharField(max_length=200),
        ),
    ]

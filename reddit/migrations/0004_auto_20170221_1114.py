# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-02-21 11:14
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('reddit', '0003_auto_20170221_1049'),
    ]

    operations = [
        migrations.AlterField(
            model_name='redditpostsnapshot',
            name='reddit_post',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reddit_post_snapshots', to='reddit.RedditPost'),
        ),
    ]

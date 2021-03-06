# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-03-22 06:56
from __future__ import unicode_literals

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('memes', '0012_auto_20170225_2356'),
    ]

    operations = [
        migrations.AddField(
            model_name='meme',
            name='created_date',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='meme',
            name='modified_date',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AddField(
            model_name='memefile',
            name='created_date',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='memefile',
            name='modified_date',
            field=models.DateTimeField(auto_now=True),
        ),
    ]

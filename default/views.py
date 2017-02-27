
from django.shortcuts import render
from blog.models import BlogPost
from django.http import HttpResponse, Http404

from data import data_tags
from django.core import serializers

def home(request):
    template = 'home.html'
    context = {
        'data_all_time': data_tags.get_memes_count('all_time'),
        'data_week': data_tags.get_memes_count('week'),
        'data_day': data_tags.get_memes_count('day')
    }
    return render(request, template, context)

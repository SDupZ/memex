from django.shortcuts import render
from data import data_tags


def home(request):
    template = 'home.html'
    context = {
        'data_all_time': data_tags.get_memes_count('all_time'),
        'data_week': data_tags.get_memes_count('week'),
        'data_day': data_tags.get_memes_count('day')
    }
    return render(request, template, context)

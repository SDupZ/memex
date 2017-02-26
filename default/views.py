
from django.shortcuts import render
from blog.models import BlogPost
from django.http import HttpResponse, Http404

from data.templatetags import data_tags


def home(request):
    template = 'home.html'
    context = {
        'data': data_tags.get_meme_count_all_time()
    }
    return render(request, template, context)

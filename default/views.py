
from django.shortcuts import render
from blog.models import BlogPost
from django.http import HttpResponse, Http404


def home(request):
    template = 'home.html'
    context = {}
    return render(request, template, context)

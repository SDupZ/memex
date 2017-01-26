from django.shortcuts import render
from blog.models import BlogPost


def home(request):
    template = 'home.html'
    context = {}
    return render(request, template, context)

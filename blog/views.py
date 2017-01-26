from django.shortcuts import render
from blog.models import BlogPost


def blog(request, slug):
    template = 'blog.html'

    blog = BlogPost.objects.get(slug=slug)

    context = {
        'blog': blog,
    }

    return render(request, template, context)

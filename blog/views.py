from django.shortcuts import render
from blog.models import BlogPost


def blogs_list(request):
    template = 'blogs-list.html'
    blogs = BlogPost.objects.all()

    context = {
        "blogs": blogs,
    }
    return render(request, template, context)


def blog(request, slug):
    template = 'blog.html'

    blog = BlogPost.objects.get(slug=slug)

    context = {
        'blog': blog,
    }

    return render(request, template, context)

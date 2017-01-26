from django.shortcuts import render
from blog.models import BlogPost


def front(request):
    template = 'index.html'
    blogs = BlogPost.objects.all()

    context = {
        "blogs": blogs,
    }
    return render(request, template, context)

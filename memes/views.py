from django.shortcuts import render


def meme(request, slug):
    template = 'meme.html'
    context = {}
    return render(request, template, context)

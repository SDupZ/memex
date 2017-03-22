from django.shortcuts import render


def validator(request):
    template = 'validator.html'
    context = {}
    return render(request, template, context)

from django.shortcuts import render
from blog.models import BlogPost
from django.http import HttpResponse, Http404
from django.views import View
import git

def home(request):
    template = 'home.html'
    context = {}
    return render(request, template, context)


class Githook(View):
    def get(self, request):
        raise Http404

    def post(self, request, *args, **kwargs)
        g = git.cmd.Git(git_dir)
        g.pull()
        return HttpResponse("OK")

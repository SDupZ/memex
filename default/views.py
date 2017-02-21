
from django.shortcuts import render
from blog.models import BlogPost
from django.http import HttpResponse, Http404
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views import View
import git

def home(request):
    template = 'home.html'
    context = {}
    return render(request, template, context)


@method_decorator(csrf_exempt, name='dispatch')
class Githook(View):
    def get(self, request):
        raise Http404

    def post(self, request, *args, **kwargs):
        g = git.cmd.Git(git_dir)
        g.pull()
        return HttpResponse("OK")

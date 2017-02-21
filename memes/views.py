from django.shortcuts import render
from django.http import HttpResponse, Http404
from django.views import View


def meme(request, slug):
    template = 'meme.html'
    context = {}
    return render(request, template, context)


class Githook(View):
    def get(self, request):
        raise Http404

    def post(self, request, *args, **kwargs):
        import pdb; pdb.set_trace()
        return HttpResponse("OK")

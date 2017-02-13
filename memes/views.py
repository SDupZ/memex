from rest_framework import mixins, viewsets
from .models import Job, RedditPost
from .serializers import JobSerializer, RedditPostSerializer
from django.shortcuts import render


class JobViewSet(mixins.CreateModelMixin,
                 mixins.ListModelMixin,
                 mixins.RetrieveModelMixin,
                 viewsets.GenericViewSet):
    """
    API endpoint that allows jobs to be viewed or created.
    """
    queryset = Job.objects.all()
    serializer_class = JobSerializer


class RedditPostViewSet(mixins.CreateModelMixin,
                mixins.ListModelMixin,
                mixins.RetrieveModelMixin,
                viewsets.GenericViewSet):
    """
    API endpoint that allows jobs to be viewed or created.
    """
    queryset = RedditPost.objects.all()
    serializer_class = RedditPostSerializer


def meme(request, slug):
    template = 'meme.html'
    context = {}
    return render(request, template, context)

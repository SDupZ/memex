from rest_framework import mixins, viewsets
from .models import RedditPost
from .serializers import RedditPostSerializer


class RedditPostViewSet(mixins.CreateModelMixin,
                        mixins.ListModelMixin,
                        mixins.RetrieveModelMixin,
                        viewsets.GenericViewSet):
    queryset = RedditPost.objects.all()
    serializer_class = RedditPostSerializer

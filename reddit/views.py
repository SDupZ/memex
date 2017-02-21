from rest_framework import mixins, viewsets
from .models import RedditPost, RedditPostSnapshot
from .serializers import RedditPostSerializer, RedditPostSnapshotSerializer


class RedditPostViewSet(mixins.CreateModelMixin,
                        mixins.ListModelMixin,
                        mixins.RetrieveModelMixin,
                        viewsets.GenericViewSet):
    queryset = RedditPost.objects.all()
    serializer_class = RedditPostSerializer


class RedditPostSnapshotViewSet(mixins.CreateModelMixin,
                        mixins.ListModelMixin,
                        mixins.RetrieveModelMixin,
                        viewsets.GenericViewSet):
    queryset = RedditPostSnapshot.objects.all()
    serializer_class = RedditPostSnapshotSerializer

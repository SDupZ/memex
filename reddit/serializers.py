from rest_framework import serializers

from .models import RedditPost


class RedditPostSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = RedditPost
        fields = '__all__'

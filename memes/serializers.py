from rest_framework import serializers

from .models import Job, RedditPost


class JobSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Job
        fields = '__all__'


class RedditPostSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = RedditPost
        fields = '__all__'

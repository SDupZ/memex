from rest_framework import serializers

from .models import RedditPost, RedditPostSnapshot


class RedditPostSerializer(serializers.HyperlinkedModelSerializer):
    # snapshots = serializers.HyperlinkedRelatedField(
    #     many=True,
    #     read_only=True,
    #     view_name='reddit_post_snapshots'
    # )
    class Meta:
        model = RedditPost
        fields = (
            'submission_id',
            'image_similarity',
            'image_url',
            'title',
            'subreddit',
            'subreddit_id',
            'permalink',
            'submission_created',
            'author',
            # 'snapshots',
        )


class RedditPostSnapshotSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = RedditPostSnapshot
        fields = '__all__'

from django.contrib import admin
from reddit.models import RedditPost, RedditPostSnapshot


class RedditPostSnapshotInline(admin.StackedInline):
    model = RedditPostSnapshot
    extra = 1


class RedditPostAdmin(admin.ModelAdmin):
    inlines = [RedditPostSnapshotInline, ]


admin.site.register(RedditPost, RedditPostAdmin)

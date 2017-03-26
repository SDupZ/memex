from django.contrib import admin
from reddit.models import RedditPost, RedditPostSnapshot


class RedditPostSnapshotInline(admin.StackedInline):
    model = RedditPostSnapshot
    extra = 1


class RedditPostAdmin(admin.ModelAdmin):
    inlines = [RedditPostSnapshotInline, ]

    list_display = ('title', 'likely_meme', 'image_similarity', 'submission_created',)

    search_fields = ('title', 'likely_meme__name',)
    readonly_fields = ('created_date', 'modified_date')


admin.site.register(RedditPost, RedditPostAdmin)

from django.conf.urls import url, include
from django.contrib import admin
from django.views.static import serve
from rest_framework import routers

from django.conf import settings
from default.views import home
from blog.views import blog, blogs_list
from memes.views import meme
from reddit.views import RedditPostViewSet, RedditPostSnapshotViewSet
from utils.views import validator

from filer.models import Folder, ThumbnailOption

router = routers.DefaultRouter()
router.register(r'redditposts', RedditPostViewSet)
router.register(r'redditpostsnapshots', RedditPostSnapshotViewSet)

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', home, name='home'),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),

    url(r'^api/', include(router.urls)),

    url(r'^blog/?$', blogs_list, name='blogs_list'),
    url(r'^blog/(?P<slug>[^/]+)$', blog, name='blog'),
    url(r'^m/(?P<slug>[^/]+)$', meme, name='meme'),

    # TODO staff only or authenitcation only
    url(r'^validator/?$', validator, name='validator'),

    url(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
]

admin.site.unregister(Folder)
admin.site.unregister(ThumbnailOption)

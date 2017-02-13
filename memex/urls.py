from django.conf.urls import url, include
from django.contrib import admin
from django.views.static import serve
from rest_framework import routers

from django.conf import settings
from default.views import home
from blog.views import blog, blogs_list
from memes.views import meme, JobViewSet, RedditPostViewSet

from filer.models import Folder, ThumbnailOption

router = routers.DefaultRouter()
# register job endpoint in the router
router.register(r'jobs', JobViewSet)
router.register(r'redditposts', RedditPostViewSet)

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', home, name='home'),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),

    url(r'^api/', include(router.urls)),

    url(r'^blog/?$', blogs_list, name='blogs_list'),
    url(r'^blog/(?P<slug>[^/]+)$', blog, name='blog'),

    url(r'^m/(?P<slug>[^/]+)$', meme, name='meme'),

    url(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
]

admin.site.unregister(Folder)
admin.site.unregister(ThumbnailOption)

from django.conf.urls import url
from django.contrib import admin
from django.views.static import serve

from django.conf import settings
from default.views import front
from blog.views import blog

from filer.models import Folder, ThumbnailOption

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^$', front, name='front'),

    url(r'^blog/(?P<slug>[^/]+)$', blog, name='blog'),

    url(r'^media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
]

admin.site.unregister(Folder)
admin.site.unregister(ThumbnailOption)

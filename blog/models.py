from datetime import datetime
from django.db import models
from ckeditor.fields import RichTextField
from filer.fields.image import FilerImageField


class BlogPost(models.Model):
    created = models.DateTimeField(db_index=True, auto_now_add=True)
    modified = models.DateTimeField(db_index=True, auto_now=True)

    header_image = FilerImageField(blank=True, null=True, related_name="blog_header_image")
    title = models.CharField(db_index=True, max_length=150)
    slug = models.SlugField(unique=True, max_length=150)

    blurb = models.TextField(blank=True, null=True, max_length=150)
    content = RichTextField(blank=True, null=True)

    def __unicode__(self):
        return self.slug

    class Meta:
        verbose_name = "Blog Post"

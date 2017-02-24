from django.contrib import admin
from memes.models import Meme, MemeFile


class MemeFileInline(admin.StackedInline):
    model = MemeFile
    extra = 1


class MemeAdmin(admin.ModelAdmin):
    inlines = [MemeFileInline, ]


admin.site.register(Meme, MemeAdmin)

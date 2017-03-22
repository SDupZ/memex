from django.contrib import admin
from data.models import MemeDataSnapshot24Hour


class MemeDataSnapshot24HourAdmin(admin.ModelAdmin):
    list_display = ('meme', 'crs_l24hrs', 'np_l24hrs',)
    search_fields = ('meme',)
    ordering = ('meme',)

admin.site.register(MemeDataSnapshot24Hour, MemeDataSnapshot24HourAdmin)

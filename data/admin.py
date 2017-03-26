from django.contrib import admin
from data.models import MemeDataSnapshot24Hour


class MemeDataSnapshot24HourAdmin(admin.ModelAdmin):
    list_display = ('meme', 'crs_l24hrs', 'np_l24hrs', 'created_date')
    search_fields = ('meme',)
    ordering = ('meme',)

    fieldsets = (
        ('Snapshot', {
            'fields': ('meme', 'crs_l24hrs', 'np_l24hrs',),
        }),
        ('Admin', {
            'classes': ('collapse',),
            'fields': ('created_date', 'modified_date')
        })
    )
    readonly_fields = ('created_date', 'modified_date')

admin.site.register(MemeDataSnapshot24Hour, MemeDataSnapshot24HourAdmin)

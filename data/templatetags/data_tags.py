from django import template
from memes.models import Meme

register = template.Library()

@register.simple_tag
def get_meme_count_all_time():
    all_memes = Meme.objects.all()

    results = []
    for meme in all_memes:
        number_of_posts = len(meme.redditpost_set.all())
        results.append((meme.name, number_of_posts))
    results = sorted(results, key=lambda x: x[1])
    results.reverse()
    return results

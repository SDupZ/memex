from django.core.serializers.json import DjangoJSONEncoder
from datetime import datetime, timedelta
import json

from memes.models import Meme


def get_memes_count(filter_by):
    memes = Meme.objects.all()
    results = []
    for meme in memes:
        if (filter_by == "day"):
            reddit_posts_set = meme.redditpost_set.filter(submission_created__lte=datetime.now(), submission_created__gte=(datetime.now() - timedelta(days=1)))
        elif (filter_by == "week"):
            reddit_posts_set = meme.redditpost_set.filter(submission_created__lte=datetime.now(), submission_created__gte=(datetime.now() - timedelta(weeks=1)))
        else:
            reddit_posts_set = meme.redditpost_set.all()

        number_of_posts = len(reddit_posts_set)
        results.append((meme.name, number_of_posts))
    results = sorted(results, key=lambda x: x[1])
    results.reverse()
    results = results[:10]
    result_dict = {}
    for item in results:
        result_dict[item[0]] = item[1]
    return json.dumps(result_dict, cls=DjangoJSONEncoder)

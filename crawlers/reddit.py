#!/usr/bin/python
import praw
import re
import indicoio
import pdb
import json
from os import listdir
from os.path import isfile, join
from scipy import spatial

from imageLibrary import parse_reddit_url, generate_probabilities


reddit = praw.Reddit('bot1')
subreddit = reddit.subreddit("adviceanimals")

print("===========BEGIN==============")

reddit_data = []

for submission in subreddit.hot(limit=30):
    if not (submission.stickied):
        print (submission.title)
        try:
            meme_url = parse_reddit_url(submission.url)
            result = generate_probabilities(meme_url)
            highest_similarity = max(result, key=lambda i: result[i])
            reddit_data.append(
                {
                    'id': submission.id,
                    'meme': highest_similarity,
                    'similarity': result[highest_similarity],
                    'url': submission.url,
                    'gilded': submission.gilded,
                    'score': submission.score,
                    'title': submission.title,
                    'subreddit': str(submission.subreddit),
                    'subreddit_id': submission.subreddit_id,
                    'permalink': submission.permalink,
                    'created': submission.created
                })
        except Exception as e:
            print ("ERRUH " + str(e) + " : " + str(submission.title))

json.dump(reddit_data, open('results.json', 'w'), indent=4, sort_keys=True)
print("===========DONE==============")

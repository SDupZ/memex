#!/usr/bin/python
import praw
import indicoio
import json
import pdb
from datetime import datetime
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
            likely_meme = max(result, key=lambda i: result[i])
            reddit_data.append(
                {
                    'id': submission.id,
                    'meme': likely_meme,
                    'similarity': result[likely_meme],
                    'url': submission.url,
                    'gilded': submission.gilded,
                    'score': submission.score,
                    'title': submission.title,
                    'subreddit': str(submission.subreddit),
                    'subreddit_id': submission.subreddit_id,
                    'permalink': submission.permalink,
                    'submission_created': submission.created,
                    'date_crawled': datetime.now(),
                    'author': submission.author,
                })
        except Exception as e:
            print ("ERRUH " + str(e) + " : " + str(submission.title))

json.dump(reddit_data, open('results.json', 'w'), indent=4, sort_keys=True)
print("===========DONE==============")

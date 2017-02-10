#!/usr/bin/python
import praw
import re

reddit = praw.Reddit('bot1')


subreddit = reddit.subreddit("adviceanimals")
keyword = 'pepe'

print("===========BEGIN==============")

# for submission in subreddit.hot(limit=100):
for submission in subreddit.top(time_filter='all'):
    print("Searching title and text for: ")
    print(submission.title)
    if re.search(keyword, submission.title, re.IGNORECASE) or re.search(keyword, submission.selftext, re.IGNORECASE):
        print("MATCH FOUND: " + submission.title.encode('utf-8'))
        print(submission.selftext.encode('utf-8'))

    print("Searching comments...")
    for comment in submission.comments:
        try:
            if re.search(keyword, comment.body, re.IGNORECASE) or re.search(keyword, comment.body, re.IGNORECASE):
                print("MATCH FOUND: " + comment.body.encode('utf-8'))
        except:
            pass

    print("=========================")

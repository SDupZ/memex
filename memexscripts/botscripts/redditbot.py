#!/usr/bin/python
import praw
import re

reddit = praw.Reddit('bot1')

subreddit = reddit.subreddit("all")

for submission in subreddit.hot(limit=30):
        if re.search("trump", submission.title, re.IGNORECASE) or re.search("trump", submission.selftext, re.IGNORECASE):
            print(submission.title)
            print(submission.selftext)
            print("=========================")

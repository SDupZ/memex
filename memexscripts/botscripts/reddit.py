#!/usr/bin/python
import praw
import re
import indicoio
import pdb
import json
from os import listdir
from os.path import isfile, join
from scipy import spatial

indicoio.config.api_key = 'a43cdf55368bc533dc45c5686188466c'

# meme_url = "http://i.imgur.com/0OKfI7k.jpg"       # Confession Bear
# meme_url = "http://i.imgur.com/PRH84l5.jpg"       # Awkward Moment Seal
# meme_url = "https://i.redd.it/1y5e4ire8vey.png"   # Actual Advice Mallard
meme_url = "http://i.imgur.com/YIdH1UW.png"       # Good guy greg
# meme_url = "https://i.reddituploads.com/93d87c8ec9774cbf899f9bbd0ebdb56f?fit=max&h=1536&w=1536&s=dd934cefffd3913d2c65a3ca74fbe656"
# meme_url = "https://i.redd.it/srr4dxlrrsey.jpg"
# meme_url = "https://media.makeameme.org/created/buys-her-a-ryov21.jpg"
# meme_url = "https://i.imgur.com/y9c2RwE.png"
# meme_url = "http://i.memecaptain.com/gend_images/nCv-Rw.jpg"
# meme_url = "https://i.imgur.com/XbTq6MD.jpg"
# meme_url = "http://e.lvme.me/mqk598h.jpg"

# reddit = praw.Reddit('bot1')
# subreddit = reddit.subreddit("adviceanimals")
#
# print("===========BEGIN==============")
#
# for submission in subreddit.hot(limit=100):
#     pdb.set_trace()
#
#     print("=========================")


# Return an array with the most likely meme and the likelyness
def getMostLikelyMeme(image):
    with open('memedbfeatures.json') as data_file:
        data = json.load(data_file)
        dataSetI = indicoio.image_features(image)
        results = {}
        for meme in data['images']:
            for idx, imgdata in enumerate(meme['features']):
                similarity = 1 - spatial.distance.cosine(dataSetI, imgdata)
                results[meme['src'][idx]] = similarity
        return results


# Imgur links dont link to the image directly. They link to the page. Need to
# get the actual image
def returnDirectImgurLink(url):
    return url

result = getMostLikelyMeme(meme_url)
highest_similarity = max(result, key=lambda i: result[i])

print ("Most likely meme is: " + str(highest_similarity) + " with probability: " + str(result[highest_similarity]))

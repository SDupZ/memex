#!/usr/bin/python

# The purpse of this script is to download all memes from memebetter.com

import pdb
import json
import urllib
import pdb

with open('memedbfeatures.json') as data_file:
    data = json.load(data_file)
    newdata = {'memes': {}}

    for meme in enumerate(data['images']):
        newdata['memes'].update({
            meme[1]['title']: {
                'keywords': meme[1]['keywords'],
                'images': {
                    meme[1]['src'][0]: meme[1]['features'][0],
                }
            }
        })

    json.dump(newdata, open('memedbfeaturesupdated.json', 'w'))

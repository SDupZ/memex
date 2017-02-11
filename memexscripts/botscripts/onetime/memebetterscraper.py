#!/usr/bin/python

# The purpse of this script is to download all memes from memebetter.com

import pdb
import json
import urllib

baseURL = 'http://memebetter.com/img/'

with open('config.json') as data_file:
    data = json.load(data_file)

totalCount = data['images'].__len__()
i = 0
for image in data['images']:
    i += 1
    urllib.urlretrieve(baseURL + image['src'], "images/memes/" + image['src'])
    print "Downloaded " + str(i) + " of " + str(totalCount)
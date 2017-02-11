#!/usr/bin/python

import indicoio
import json
from os import listdir

indicoio.config.api_key = 'a43cdf55368bc533dc45c5686188466c'

features = []

# Get all image files in the images meme folder
all_memes = [f for f in listdir('images/memes') if (str(f) != '.DS_Store')]
size = all_memes.__len__()

# Open the memedb to see what images have already had their features dumped
with open('memedbfeatures.json') as data_file:
    data = json.load(data_file)

    # For each image that is in the images folder
    for idx, image in enumerate(all_memes):
        print (str(idx + 1) + " of " + str(size) + " " + image)
        found = False
        indexed = False
        # Look for an associated memesdb entry
        for meme in data['images']:
            if (image in meme['src']):
                found = True
                if (meme.has_key("features") and meme['src'].__len__() == meme['features'].__len__()):
                    pass
                    # print (meme['title'] + " has already been indexed.")
                else:
                    features = []
                    img = ('images/memes/' + image)
                    features.append(indicoio.image_features(img))
                    meme['features'].append(features)
                break

        # Didn't find any entries
        if (found == False):
            print ("-----New Meme Found: " + image)
            title = raw_input('Enter the name for this meme: ')
            print ('Enter space deliminated keywords for this meme: ')
            keywords = raw_input()
            data['images'].append({
                "title": title,
                "keywords": keywords,
                "src": [image],
                "features": []
            })

    json.dump(data, open('memedbfeatures.json', 'wb'))

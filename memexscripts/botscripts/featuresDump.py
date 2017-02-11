#!/usr/bin/python

import indicoio
import json
from os import listdir

indicoio.config.api_key = 'a43cdf55368bc533dc45c5686188466c'

# Get all image files in the images meme folder
all_memes = [f for f in listdir('images/memes') if (str(f) != '.DS_Store')]
size = all_memes.__len__()

# Open the memedb to see what images have already had their features dumped
with open('memedb.json') as data_file:
    data = json.load(data_file)

    # For each image that is in the images folder
    for idx, image in enumerate(all_memes):
        print (str(idx) + " of " + str(size))
        found = False
        # Look for an associated memesdb entry
        for meme in data['images']:
            if (image in meme['src']):
                found = True
                break
        # Didn't find any entries
        if (found == False):
            print image
        else:
            features = []
            img = ('images/memes/' + image)
            features.append(indicoio.image_features(img))
            meme['features'] = features

    json.dump(data, open('memedbfeatures.json', 'wb'))

# i = 0
# for image in all_memes:
#     i += 1
#     img = ('images/memes/' + image)
#     features.append(indicoio.image_features(img))
#     print (str(i) + " of " + str(size))
#
# json.dump(features, open('features.json', 'wb'))

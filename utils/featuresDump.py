#!/usr/bin/python

import indicoio
import json
from os import listdir

indicoio.config.api_key = 'a43cdf55368bc533dc45c5686188466c'

features = []

# Get all image files in the images meme folder
all_memes = [f for f in listdir('memes') if (str(f) != '.DS_Store')]
size = all_memes.__len__()

# Open the memedb to see what images have already had their features dumped
with open('memedbfeatures.json') as data_file:
    data = json.load(data_file)

    new_memes = []
    # For each image that is in the images folder
    for idx, image in enumerate(all_memes):
        print (str(idx + 1) + " of " + str(size) + " " + image)
        found = False
        # Look for an associated memesdb entry
        for meme in data['memes']:
            if (image in data['memes'][meme]['images'].keys()):
                found = True
                break

        # Didn't find any entries
        if (not found):
            new_memes.append(image)

    for new_meme in new_memes:
        print ("-----New Meme Found: " + new_meme)
        title = input('Enter the name for this meme: ')
        img = ('memes/' + new_meme)
        features = indicoio.image_features(img)
        data['memes'][title]['images'].update({new_meme: features})
    json.dump(data, open('memedbfeatures.json', 'w'))

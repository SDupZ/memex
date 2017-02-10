#!/usr/bin/python

import indicoio
import json
from os import listdir

indicoio.config.api_key = 'a43cdf55368bc533dc45c5686188466c'

features = []
all_memes = [f for f in listdir('images/memes') if (str(f) != '.DS_Store')]
size = all_memes.__len__()

i = 0
for image in all_memes:
    i += 1
    img = ('images/memes/' + image)
    features.append(indicoio.image_features(img))
    print (str(i) + " of " + str(size))

json.dump(features, open('features.json', 'wb'))

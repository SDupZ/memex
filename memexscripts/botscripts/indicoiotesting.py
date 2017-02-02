#!/usr/bin/python
import indicoio
from scipy import spatial

indicoio.config.api_key = 'a43cdf55368bc533dc45c5686188466c'

image0 = 'images/meme5.jpg'
image1 = 'images/meme2.jpg'

# single example
dataSetI = indicoio.image_features(image0)
dataSetII = indicoio.image_features(image1)

similarity = 1 - spatial.distance.cosine(dataSetI, dataSetII)

print(similarity)

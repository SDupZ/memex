import indicoio
import json
from scipy import spatial
import os

indicoio.config.api_key = 'a43cdf55368bc533dc45c5686188466c'
base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Return an array with the most likely meme and the likelyness
def generate_probabilities(image):
    with open(base_dir + '/reddit/memedbfeatures.json') as data_file:
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
def parse_reddit_url(url):
    if ('//imgur.com' in url):
        insertIndex = url.index("//") + 2
        url = url[0:insertIndex] + "i." + url[insertIndex:] + ".jpg"
    return url

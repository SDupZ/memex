import indicoio
import json
from scipy import spatial
import os

indicoio.config.api_key = 'a43cdf55368bc533dc45c5686188466c'
base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Return an array with the most likely meme and the likelyness
def generate_probabilities(image):
    with open(base_dir + '/utils/memedbfeatures.json') as data_file:
        data = json.load(data_file)
        target_features = indicoio.image_features(image)
        results = {}
        for meme in data['memes']:
            for image in data['memes'][meme]['images'].keys():
                imgdata = data['memes'][meme]['images'][image]
                similarity = 1 - spatial.distance.cosine(target_features, imgdata)
                results[image] = similarity
        return results


# Some links dont link to the image directly. They link to the page. Need to
# get the actual image
def parse_reddit_url(url):
    if ('//imgur.com' in url):
        insertIndex = url.index("//") + 2
        url = url[0:insertIndex] + "i." + url[insertIndex:] + ".jpg"
    elif ('//www.livememe.com/' in url):
        url = url + ".jpg"
    elif ('//imgflip.com/i/' in url and '#' in url[url.index('/i/'):]):
        insertIndex = url.index("//") + 2
        url = url[0:insertIndex] + "i." + url[insertIndex:]
        startindex = url.index("/i/")
        endindex = url[startindex+3:].index("#")
        suffix = url[startindex+3:startindex+3+endindex] + '.jpg'
        url = url[:startindex] + "/" + suffix
    elif ('//imgflip.com/i/' in url and '.jpg' not in url):
        url = url + ".jpg"
    return url

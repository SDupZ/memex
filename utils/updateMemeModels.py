import indicoio
import json
from scipy import spatial
import os

from memes.models import Meme, MemeFile

base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def update():
    with open(base_dir + '/utils/memedbfeatures.json') as data_file:
        data = json.load(data_file)
        # Delete all memes from django database then repopuplate
        for meme in data['memes']:

            import pdb
            pdb.set_trace()
            for image in data['memes'][meme]['images'].keys():
                # imgdata = data['memes'][meme]['images'][image]
                # similarity = 1 - spatial.distance.cosine(target_features, imgdata)
                # results[image] = similarity
                print (image)

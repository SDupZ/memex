import json
import os

from django.core.management.base import BaseCommand, CommandError
from memes.models import Meme, MemeFile

base_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

class Command(BaseCommand):
    help = "Load's the meme models from memedbfeatures.json which is generated from featuresdump"

    def handle(self, *args, **options):
        with open(base_dir + '/utils/memedbfeatures.json') as data_file:
            data = json.load(data_file)

            # Delete all memes from django database then we will repopulate from JSON dump
            Meme.objects.all().delete()
            self.stdout.write("Deleted all Meme models...")

            count = 0
            for meme_name in data['memes']:
                count += 1
                meme = Meme(name=meme_name)
                meme.save()
                for filename in data['memes'][meme_name]['images'].keys():
                    memefile = MemeFile(meme=meme, filename=filename)
                    memefile.save()
                self.stdout.write("" + str(count) + ": Saved new meme " + meme_name)

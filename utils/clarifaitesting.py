import json

from clarifai.rest import ClarifaiApp
from clarifai.rest import Image as ClImage

app = ClarifaiApp("PaMXkAIYX8uC8aBZyUTaZ1D_pF39noCL1CIezv4n", "e454Ac42Wy9tFg_PGtO0Fgw49gkkSBoY_7htSnTH")
model = app.models.get('Memes')

img_urls = [
    # 'http://s2.quickmeme.com/img/cf/cfa13abd35b9f24f983835f4e05dbe8301bbbd0523019b4f26099bc8b1057cea.jpg',
    # 'http://s2.quickmeme.com/img/cf/cfa13abd35b9f24f983835f4e05dbe8301bbbd0523019b4f26099bc8b1057cea.jpg',
    # 'http://s2.quickmeme.com/img/23/238c25ca930c28e28c1e9b1af8cab52d1dbdb9a91c83521d9eeed4ee948d434a.jpg',
    # 'https://cdn.meme.am/cache/instances/folder938/250x250/35019938.jpg',
    # 'http://www.dumpaday.com/wp-content/uploads/2012/12/Actual-Advice-Mallard-Meme-thumb.jpg',
    # 'http://cdn.smosh.com/sites/default/files/ftpuploads/bloguploads/actual-advice-nooks-crannies.jpg',
    #
    # 'http://s2.quickmeme.com/img/af/afe7deb645ab0b24d5277e918815bf6f83779ff6d568a4e38d9e8f848a8526d9.jpg',
    # 'http://i2.kym-cdn.com/photos/images/facebook/000/449/184/897.jpg',
    'http://i3.kym-cdn.com/photos/images/original/000/584/159/5c3.jpg'
    ]

images = []
for img_url in img_urls:
    image = ClImage(url=img_url)
    images.append(image)

results = model.predict(images)

import pdb; pdb.set_trace()


# Some training shit
# with open('memedbfeatures.json') as data_file:
#     data = json.load(data_file)
#     imgs = []
#     for meme in data['memes']:
#         for filename in data['memes'][meme]['images']:
#             image = ClImage(file_obj=open('memes/' + filename, 'rb'), concepts=[meme])
#             imgs.append(image)
#     app.inputs.bulk_create_images(imgs)

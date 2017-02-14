from imageLibrary import generate_probabilities, parse_reddit_url

# meme_url = "http://i.imgur.com/0OKfI7k.jpg"       # Confession Bear
# meme_url = "http://i.imgur.com/PRH84l5.jpg"       # Awkward Moment Seal
# meme_url = "https://i.redd.it/1y5e4ire8vey.png"   # Actual Advice Mallard
# meme_url = "http://i.imgur.com/YIdH1UW.png"       # Good guy greg
# meme_url = "https://i.reddituploads.com/93d87c8ec9774cbf899f9bbd0ebdb56f?fit=max&h=1536&w=1536&s=dd934cefffd3913d2c65a3ca74fbe656"
# meme_url = "https://i.redd.it/srr4dxlrrsey.jpg"
# meme_url = "https://media.makeameme.org/created/buys-her-a-ryov21.jpg"
# meme_url = "https://i.imgur.com/y9c2RwE.png"
# meme_url = "http://i.memecaptain.com/gend_images/nCv-Rw.jpg"
# meme_url = "https://i.imgur.com/XbTq6MD.jpg"
# meme_url = "http://ichef.bbci.co.uk/images/ic/704xn/p03wv8tb.jpg"
meme_url = "http://starsingers.net/wp-content/uploads/images/Xzibit.jpg"

result = generate_probabilities(meme_url)
highest_similarity = max(result, key=lambda i: result[i])
print ("Most likely meme is: " + str(highest_similarity) + " with probability: " + str(result[highest_similarity]))

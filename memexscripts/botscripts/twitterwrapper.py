#!/usr/bin/python
import twitter

# My Keys
# consumer_key = "jQq2BEpDAZ1ZRWsjEXVwVGaxG"
# consumer_secret = "QIOylWfpbK1cqh2EXppwH2ynGjEnOCF0sOTBW1AED4HpSrswvf"
#
# access_token = "2576439696-7lsU81dPtDGyAJkvVDGEQfVYpsTpZcq6d9MVxuY"
# access_token_secret = "kkdmgxKpvmdPoqLhROtcPIbrqHkWCbmdB4pMcgbBsBqeX"

# Random twitter dude
access_token = "766999276245221376-vBrbI2C7vCllPRb56O5sko2Ocn40uuJ"
access_token_secret = "weo8dbLeNA2ancEgJyMj258kw3r1zW3D9OX3SvUEXnrlB"
consumer_key = "tUbhzENsSXbdQ2dEmOP2fiOYz"
consumer_secret = "RYCYrdpmtNl3R6usXwlPcuMiQp8TXrgat4YPfZo3zyYWWDU1xn"


api = twitter.Api(consumer_key=consumer_key, consumer_secret=consumer_secret, access_token_key=access_token, access_token_secret=access_token_secret)
status = api.PostUpdate('I love Pepe dankest meme 201')

import pdb
pdb.set_trace()

print(api.VerifyCredentials())

#!/usr/bin/python
import requests
from base64 import b64encode


# ********************** Getting the bearer access token************************
def getBearerToken():
    consumer_key2 = "jQq2BEpDAZ1ZRWsjEXVwVGaxG"
    consumer_secret2 = "QIOylWfpbK1cqh2EXppwH2ynGjEnOCF0sOTBW1AED4HpSrswvf"

    consumer_key = "tUbhzENsSXbdQ2dEmOP2fiOYz"
    consumer_secret = "RYCYrdpmtNl3R6usXwlPcuMiQp8TXrgat4YPfZo3zyYWWDU1xn"

    url = "https://api.twitter.com/oauth2/token"

    credentials = b64encode(consumer_key + ":" + consumer_secret)

    headers = {
      "Authorization": "Basic " + credentials,
      "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8."
    }

    data = {
        "grant_type": "client_credentials"
    }

    response = requests.post(url, headers=headers, data=data)

    bearer_token = response.json()['access_token']
    return bearer_token



url = "https://api.twitter.com/1.1/trends/place.json?id=1"
bearer_token = getBearerToken

headers = {
  "Authorization": "Bearer " + bearer_token()
}

response = requests.get(url, headers=headers)
print(response)

import pdb

pdb.set_trace()

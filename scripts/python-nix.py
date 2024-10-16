#! /usr/bin/env nix-shell
#! nix-shell -i python3 -p python3Packages.requests
import requests

print(requests.get('https://google.com'))

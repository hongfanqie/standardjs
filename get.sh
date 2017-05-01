#!/bin/sh

root="https://raw.githubusercontent.com"

curl -o index.md "${root}/feross/standard/master/README.md"
curl -o rules.md "${root}/feross/standard/master/RULES.md"
# curl -o changelog.md "${root}/feross/standard/master/CHANGELOG.md"
curl -o awesome.md "${root}/feross/awesome-standard/master/README.md"
curl -o demo.md "${root}/feross/standard-www/gh-pages/generate-site/markdown/demo.md"

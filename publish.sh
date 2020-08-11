#!/bin/bash

echo "[*] Generating the static blog..."

rm -rf /tmp/hiveminds &> /dev/null

hugo -b https://blog.hiveminds.es -d /tmp/hiveminds

echo "[*] Setting up the GitHub repo and pushing"

cd /tmp/hiveminds && git init && git remote add origin git@github.com:hiveminds-es/hiveminds-es.github.io.git

git add * && git commit -am "Publising `date`" && git push -f origin gh-pages

echo "[*] Blog published to gh-pages"

rm -rf /tmp/hiveminds &> /dev/null

echo "[*] Bye ;)"
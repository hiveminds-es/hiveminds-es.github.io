#!/bin/bash

echo "[*] Generating the static blog..."

cwd=$(pwd)
rm -rf /tmp/hiveminds &> /dev/null

hugo -b https://blog.hiveminds.es -d /tmp/hiveminds

echo "[*] Move to the tmp folder"

cd /tmp/hiveminds

echo "[*] Adding the CNAME file"
echo "blog.hiveminds.es" > "CNAME"

echo "[*] Setting up the GitHub repo and pushing"

git init
git remote add repo git@github.com:hiveminds-es/hiveminds-es.github.io.git

git add *
git commit -am "Publising"

git checkout -b gh_pages
git push -f repo gh_pages

echo "[*] Blog published to gh_pages"

#rm -rf /tmp/hiveminds &> /dev/null

echo "[*] Bye ;)"
#!/bin/sh

set -e # fail fast
set -x # print commands

#git clone cfcr-concourse updated-cfcr-concourse-deploy
#cd updated-cfcr-concourse-deploy

cd cfcr-concourse

bosh -n deploy -d cfcr-test cfcr-manifest.yml \
 -o single-master.yml \
 -o add-hostname-to-master-certificate.yml \
 -v api-hostname=api-hostname \
 -o local-config-server.yml \
 --vars-store generated.yml

cd ..

git clone resource-git cfcr-vars

cd cfcr-vars
echo $(date) > testme

git config --global user.email "mercedes.kempany@sky.uk"
git config --global user.name "Mercedes"

git add .
git commit -m "Test date file"


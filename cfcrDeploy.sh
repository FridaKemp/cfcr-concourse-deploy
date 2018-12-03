#!/bin/sh

set -e # fail fast
set -x # print commands

git clone cfcr-concourse updated-cfcr-concourse-deploy
cd updated-cfcr-concourse-deploy

bosh -n deploy -d cfcr-test cfcr-manifest.yml \
 -o single-master.yml \
 -o add-hostname-to-master-certificate.yml \
 -v api-hostname=api-hostname \
 -o local-config-server.yml \
 --vars-store generated.yml


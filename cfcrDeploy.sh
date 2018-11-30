#!/bin/sh

set -e # fail fast
set -x # print commands

api-hostname-cfcr=$1

git clone cfcr-concourse-deploy updated-cfcr-concourse-deploy
cd updated-cfcr-concourse-deploy

bosh -n deploy -d cfcr cfcr.yml \
 -o single-master.yml \
 -o add-hostname-to-master-certificate.yml \
 -v api-hostname=api-hostname-cfcr \
 -o local-config-server.yml \
 --vars-store generated.yml


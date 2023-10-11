#!/bin/bash

# set -x

. ./project_setup.env

PIX4D_ACCESS_TOKEN=$(cat access_token.txt)
FILELIST=filelist.json

if [ -z ${PROJECT_ID} ]
then 
  echo "PROJECT_ID not set"
  exit
fi

if [ -z ${PIX4D_ACCESS_TOKEN} ]
then 
  echo "PIX4D_ACCESS_TOKEN not set"
  exit
fi

curl -s --url https://cloud.pix4d.com/project/api/v3/projects/${PROJECT_ID}/ \
  --header "Authorization: Bearer ${PIX4D_ACCESS_TOKEN}" \
  --header "Content-Type: application/json"

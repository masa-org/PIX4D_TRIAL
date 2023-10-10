#!/bin/bash

set -x

PROJECT_NAME=masa_test
PIX4D_ACCESS_TOKEN=$(cat access_token.txt)

if [ -z "${PIX4D_ACCESS_TOKEN}" ]
  then
    echo "ACCESS_TOKEN is not set"
fi

curl --request POST \
  --url https://cloud.pix4d.com/project/api/v3/projects/ \
  --header "Authorization: Bearer ${PIX4D_ACCESS_TOKEN}" \
  --header "Content-Type: application/json" \
  --data "{\"name\": \"${PROJECT_NAME}\"}"
 

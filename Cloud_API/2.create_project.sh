#!/bin/bash

# set -x

PROJECT_NAME=urban-area
PIX4D_ACCESS_TOKEN=$(cat access_token.txt)

if [ -z "${PIX4D_ACCESS_TOKEN}" ]
  then
    echo "ACCESS_TOKEN is not set"
    exit 1
fi

BODY_PROJECT=$(curl -s --request POST \
  --url https://cloud.pix4d.com/project/api/v3/projects/ \
  --header "Authorization: Bearer ${PIX4D_ACCESS_TOKEN}" \
  --header "Content-Type: application/json" \
  --data "{\"name\": \"${PROJECT_NAME}\"}")
 
PROJECT_ID=$(echo ${BODY_PROJECT} | jq -r '.id')

if [ -z "${PROJECT_ID}" ]
  then
    echo "PROJECT_ID is not set"
    exit 1
fi

BODY_AWS=$(curl -s --url https://cloud.pix4d.com/project/api/v3/projects/${PROJECT_ID}/s3_credentials/ \
  --header "Authorization: Bearer ${PIX4D_ACCESS_TOKEN}" \
  --header "Content-Type: application/json")

echo $BODY_AWS| jq 

tee project_setup.env <<EOT
export PROJECT_ID=${PROJECT_ID}
export S3_BUCKET_NAME=$(echo ${BODY_PROJECT} | jq -r '.bucket_name')
export S3_BASE_PATH=$(echo ${BODY_PROJECT} | jq -r '.s3_base_path')
export AWS_ACCESS_KEY_ID=$(echo ${BODY_AWS} | jq -r '.access_key')
export AWS_SECRET_ACCESS_KEY=$(echo ${BODY_AWS} | jq -r '.secret_key')
export AWS_SESSION_TOKEN=$(echo ${BODY_AWS} | jq -r '.session_token')
export AWS_REGION=$(echo ${BODY_AWS} | jq -r '.region')
EOT

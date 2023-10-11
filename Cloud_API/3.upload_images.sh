#!/bin/bash

# set -x

. ./project_setup.env

IMAGE_DIR=../images/image_subset_100

if [ -z ${AWS_ACCESS_KEY_ID} ]
then 
  echo "AWS_ACCESS_KEY_ID not set"
  exit
fi

if [ -z ${S3_BUCKET_NAME} ]
then 
  echo "S3_BUCKET_NAME not set"
  exit
fi


aws s3 cp ${IMAGE_DIR} "s3://${S3_BUCKET_NAME}/${S3_BASE_PATH}/" --recursive


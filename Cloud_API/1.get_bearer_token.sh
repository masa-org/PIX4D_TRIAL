#!/bin/bash

set -x

. secrets.env

if [ -z ${PIX4D_CLIENT_ID} ]
then 
  echo "CLIENT_ID not set"
  exit
fi

curl -s --request POST \
  --url https://cloud.pix4d.com/oauth2/token/ \
  --form client_id=$PIX4D_CLIENT_ID \
  --form client_secret=$PIX4D_CLIENT_SECRET \
  --form grant_type=client_credentials \
  --form token_type=access_token \
  --form token_format=jwt \
  | jq -r '.access_token' \
  | tee access_token.txt



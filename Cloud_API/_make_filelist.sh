#!/bin/bash

# output: filelist.json

# set -x

. ./project_setup.env

if [ -z ${S3_BASE_PATH} ]
then
  echo "S3_BASE_PATH not set"
  exit 1
fi

PREFIX=${S3_BASE_PATH}
FILE_DIR=../images/image_subset_100
OUTPUT=filelist.json

FILELIST=$(find ${FILE_DIR} -iname '*.jpg')
LEN=$(echo ${FILELIST} | wc -w)

i=0

tee ${OUTPUT} <<EOT
{ 
  "input_file_keys": [
EOT

for F in ${FILELIST}
do
  let i++

  if (( ${i} < ${LEN} )); then
    echo \"${PREFIX}/${F##*/}\", | tee -a ${OUTPUT} 
  else
    echo \"${PREFIX}/${F##*/}\" | tee -a ${OUTPUT} 
  fi
done

tee -a ${OUTPUT} <<EOT
  ]
}
EOT
 

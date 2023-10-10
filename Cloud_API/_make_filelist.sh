#!/bin/bash

set -x

. ./project_setup.env

if [ -z ${S3_BASE_PATH} ]
then
  echo "S3_BASE_PATH not set"
  exit 1
fi

PREFIX=${S3_BASE_PATH}/Images_subset_1469
FILE_DIR=../images/Pix4Dmatic_example_1469_images/Images_subset_1469
FILELIST=filelist.json

LEN=$(find ${FILE_DIR} -iname '*.jpg' | wc -w)
i=0

tee ${FILELIST} <<EOT
{ 
  "input_file_keys": [
EOT

for F in ${FILE_DIR}/*
do
  EXTENTION=$(echo ${F##*.} | tr '[:upper:]' '[:lower:]')
  if [ ${EXTENTION} = "jpg" ]
  then
    let i++

    if (( ${i} < ${LEN} )); then
      echo \"${PREFIX}/${F##*/}\", >> ${FILELIST} 
    else
      echo \"${PREFIX}/${F##*/}\" >> ${FILELIST} 
    fi
  fi
done

tee -a ${FILELIST} <<EOT
  ]
}
EOT
 

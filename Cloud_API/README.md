# PIX4D Trial

PIX4D Cloud API Trial

## Environment

- OS
  - Mac

## Prerequisites

- `curl`command
- `jq` command
- `watch` command
- `aws` command

## Steps - Cloud API

### 0. Preparation

--- 

`git clone <this repo>`

Go to `Cloud_API` directory, and add a PIX4D credentials.

`cd Cloud_API`

- Create a file called `secrets.env`.
- Add PIX4D credentials to `secrets.env`, like below:

```
export PIX4D_CLIENT_ID=nPs2U1OOFPP...
export PIX4D_CLIENT_SECRET=IDqVILhtwDBR3i...
```

Run `secrets.env` like below:

`. ./secrets.env`

### 1. Get bearer token

--- 

`./1.get_bearer_token.sh`

- This script will obtain a `Bearer token`.
- Bearer token is an api key necessary to invode Cloud API.
- After this step, file called `access_token.txt` which contains the Bearer token is created. 

### 2. Project set up

--- 

`./2.create_project.sh`

- This script will create a PIX4D project.
- This script also get an AWS Credential for S3 access.
- After this step, file called `project_setup.env` which contains various configs is created.

### 3. Upload images to S3

--- 

`./3.upload_images.sh`

- This script will upload images to S3 bucket using AWS CLI

### 4. Register_files

--- 

`./4.register_files.sh`

- This script will register files uploaded to S3 bucket for processing.
- You need to prepare a filelist for files to be processed.
- I created a helper script to generate a fileist. `_make_filelist.sh`

### 5. Start processing

--- 

`./5.start_processing.sh`

- This script will trigger the image processing.
- Depending on the size/numbers of images, it would take loooong time.
- Once the processing start or end, you will be notified by email.

### 6. Check the processing status

--- 

`./6.check_progress.sh`

- This script will show the progress of processing.


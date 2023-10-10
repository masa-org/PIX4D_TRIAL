# PIX4D Trial

## Environment

- OS
  - Mac

## Prerequisites

- `curl`command
- `jq` command
- `watch` command

## Steps - Cloud API

0. Clond this repo

`git clone <this repo>`

1. Go to `Cloud_API` directory, and add a PIX4D credentials.

`cd Cloud_API`

- Create a file called `secrets.env`.
- Add PIX4D credentials to `secrets.env`, like below:
```
export PIX4D_CLIENT_ID=nPs2U1OOFPP...
export PIX4D_CLIENT_SECRET=IDqVILhtwDBR3i...
```

Run `secrets.env` like below:

`. ./secrets.env`

2. Get bearer token

`./1.get_bearer_token.sh`

- This script will obtain a `Bearer token`.
- Bearer token is an api key necessary to invode Cloud API.

3. Project set up

`./2.create_project.sh`

- This script will create a PIX4D project.
- This script also get an AWS Credential for S3 access.

## Steps - SDK

Comming



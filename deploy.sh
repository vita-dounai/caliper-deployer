#!/bin/sh

set -e
set -x

git clone https://github.com/vita-dounai/caliper.git || true
cd caliper
git checkout fisco-bcos

npm i
npm run repoclean -- --yes
npm run bootstrap

cd packages/caliper-tests-integration/
npm run start_verdaccio
npm run npm_publish_local
npm install --registry=http://localhost:4873 --only=prod @hyperledger/caliper-cli
npm run stop_verdaccio
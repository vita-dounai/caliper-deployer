#!/bin/sh

set -e
set -x

cur_dir=`pwd`

git clone https://github.com/vita-dounai/caliper.git || true
cd caliper
git checkout fisco-bcos

npm install
echo 'y' | npm run repoclean
npm run bootstrap

cd packages/caliper-tests-integration/
npm run teardown_verdaccio
npm run setup_verdaccio
npm install --registry http://localhost:4873 -g caliper-cli@0.1.0
cd ${cur_dir}

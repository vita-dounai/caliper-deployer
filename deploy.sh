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
npm run e2e_install
cd ${cur_dir}

#!/bin/bash
set -e
source /build/buildconfig
set -x

cd /root
mkdir app
cd /root/app
git clone ${URL_REPO_GITHUB}
cd {$FOLDER_NAME}
git checkout staging
cp -f /build/Gemfile .
cp -f /build/database.example.yml ./config/database.yml
bundle install

/etc/init.d/mysql start &
rake db:create
rake db:migrate
rake db:seed

/etc/init.d/nginx restart &


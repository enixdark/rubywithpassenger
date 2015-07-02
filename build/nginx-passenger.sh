#!/bin/bash
set -e
source /build/buildconfig
source /etc/environment
set -x



## Install Phusion Passenger.
apt-get update

if [[ "$PASSENGER_ENTERPRISE" ]]; then
	apt-get install -y --force-yes nginx passenger-enterprise
else
	apt-get install -y --force-yes nginx passenger
fi
cp /build/config/30_presetup_nginx.sh /etc/init.d/
cp /build/config/nginx.conf /etc/nginx/nginx.conf
mkdir -p /etc/nginx/main.d
cp /build/config/nginx_main_d_default.conf /etc/nginx/main.d/default.conf

## Install Nginx runit service.
mkdir -p /etc/service/nginx
cp /build/runit/nginx /etc/service/nginx/run
touch /etc/service/nginx/down

mkdir -p /etc/service/nginx-log-forwarder
cp /build/runit/nginx-log-forwarder /etc/service/nginx-log-forwarder/run

## Precompile Ruby extensions.
if [[ -e /usr/bin/ruby2.2 ]]; then
	ruby2.2 -S passenger-config build-native-support
fi

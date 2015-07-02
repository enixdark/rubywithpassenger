#!/bin/bash

set -e
source /build/buildconfig
set -x
minimal_apt_get_install software-properties-common
## Brightbox Ruby
add-apt-repository ppa:brightbox/ruby-ng-experimental 

## Phusion Passenger for ubuntu LTS 15.04
if [[ "$PASSENGER_ENTERPRISE" ]]; then
	echo deb https://download:YOUR_DOWNLOAD_TOKEN@www.phusionpassenger.com/enterprise_apt vivid main > /etc/apt/sources.list.d/passenger.list
else
	echo deb https://oss-binaries.phusionpassenger.com/apt/passenger vivid main > /etc/apt/sources.list.d/passenger.list
fi

# # The recv-keys part takes a bit of time, so it's faster to receive multiple keys at once.
# #
# # Phusion Passenger

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6 561F9B9CAC40B2F7
chown root: /etc/apt/sources.list.d/passenger.list
chmod 600 /etc/apt/sources.list.d/passenger.list

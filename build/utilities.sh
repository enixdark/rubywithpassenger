#!/bin/bash
set -e
source /build/buildconfig
set -x

apt-get install -y apt-transport-https ca-certificates
## Many Ruby gems and NPM packages contain native extensions and require a compiler.
minimal_apt_get_install build-essential git wget 

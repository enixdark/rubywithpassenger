#!/bin/bash

set -e
source /build/buildconfig
set -x



apt-get install -y mysql-server

# cat > /etc/mysql/conf.d/mysql-listen.cnf <<EOF
# [mysqld]
# bind = 0.0.0.0
# EOF



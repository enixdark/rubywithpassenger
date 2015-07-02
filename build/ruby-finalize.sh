#!/bin/bash
set -e
source /build/buildconfig
set -x

# The --bindir is necessary for JRuby. We don't want jgem to install to /usr/local/jruby-xxx/bin.
echo "gem: --no-ri --no-rdoc --bindir /usr/local/bin" > /etc/gemrc

## Fix shebang lines in rake and bundler so that they're run with the currently
## configured default Ruby instead of the Ruby they're installed with.
sed -i 's|/usr/bin/env ruby.*$|/usr/bin/env ruby|; s|/usr/bin/ruby.*$|/usr/bin/env ruby|' \
	/usr/local/bin/rake /usr/local/bin/bundle /usr/local/bin/bundler

## The Rails asset compiler requires a Javascript runtime.
minimal_apt_get_install nodejs

## Install development headers for native libraries that tend to be used often by Ruby gems.

## For nokogiri.
minimal_apt_get_install libxml2-dev libxslt1-dev
## For rmagick and minimagick.
minimal_apt_get_install imagemagick libmagickwand-dev
## For mysql and mysql2.
minimal_apt_get_install libmysqlclient-dev
## For sqlite3.
minimal_apt_get_install libsqlite3-dev
## For postgres and pg.
minimal_apt_get_install libpq-dev
## For curb.
minimal_apt_get_install libcurl4-openssl-dev
## For all kinds of stuff.
minimal_apt_get_install zlib1g-dev


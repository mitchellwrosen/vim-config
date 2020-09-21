#!/bin/sh

set -e

fennel --compile fennel/init.fnl > /tmp/init.lua
mv /tmp/init.lua lua/init.lua

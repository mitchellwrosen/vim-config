#!/bin/sh

set -e

FILE=/tmp/xxx.lua

fennel --compile fennel/init.fnl > $FILE
mv $FILE lua/init.lua

fennel --compile fennel/filetype-fennel.fnl > $FILE
mv $FILE lua/ftplugin/fennel.lua

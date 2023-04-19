#!/bin/sh

set -e

fennel --compile stdlib.fnl > lua/stdlib.lua
fennel --compile fennel/init.fnl > lua/init.lua

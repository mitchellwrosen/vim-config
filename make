#!/bin/sh

set -e

fennel --compile fennel/init.fnl > lua/init.lua

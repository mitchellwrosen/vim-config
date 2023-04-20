#!/bin/sh

set -e

# haha don't want to figure out how to write a for-loop in bash
fennel --compile stdlib.fnl > lua/stdlib.lua
fennel --compile init.fnl > lua/init.lua

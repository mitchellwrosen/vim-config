#!/bin/sh

set -e

# haha don't want to figure out how to write a for-loop in bash
fennel --compile filetype-fzf.fnl > ftplugin/fzf.lua
fennel --compile filetype-gitcommit.fnl > ftplugin/gitcommit.lua
fennel --compile filetype-unison.fnl > ftplugin/unison.lua
fennel --compile stdlib.fnl > lua/stdlib.lua
fennel --compile init.fnl > lua/init.lua

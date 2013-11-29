#!/bin/sh

alias makepkg="makepkg --asroot --config $PWD/makepkg.conf"
export PATH=/stage1/bin:/stage0/bin:$PATH
set +h

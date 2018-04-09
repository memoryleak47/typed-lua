#!/bin/bash

if [ -z "$1" ]; then
	echo "missing argument"
	echo "choose one of:"
	echo
	ls *.lua | grep -v prelude.lua
	exit
fi

x="$(basename -s ".lua" $1)"

if [ "$x" == "prelude" ]; then
	echo "prelude is not an example"
	exit
fi

if [ ! -f "$x.lua" ]; then
	echo "example does not exist"
	exit
fi

cargo run "$x.lua" -o ".$x.compiled"
lua ".$x.compiled"

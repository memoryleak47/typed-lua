#!/bin/bash

mkdir -p build/test

for file in $(ls "test")
do
	for mode in "release" "debug"
	do
		cargo run -- "test/$file/typed.lua" "-o" "build/test/$mode/$file.lua" "--$mode"
		if ! diff "build/test/$mode/$file.lua" "test/$file/$mode.lua" >/dev/null; then
			echo "ERROR: build/test/$mode/$file.lua != test/$file/$mode.lua"
			diff "build/test/$mode/$file.lua" "test/$file/$mode.lua"
			exit 1
		fi
	done
done

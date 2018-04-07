#!/bin/bash

mkdir -p build/test/debug
mkdir -p build/test/release

for file in $(ls "test")
do
	for mode in "release" "debug"
	do
		cargo run -- "test/$file/typed.lua" "-o" "build/test/$mode/$file.lua" "--$mode" 2&> /dev/null
		if diff "build/test/$mode/$file.lua" "test/$file/$mode.lua" >/dev/null; then
			echo "SUCCESS: test/$file/$mode.lua"
		else
			echo "FAILURE: test/$file/$mode.lua"
			diff "build/test/$mode/$file.lua" "test/$file/$mode.lua"
		fi
	done
done

#!/usr/bin/env bash

#construct a dummy newline.txt file
printf "\n\n \n" > ./build/.newline.txt

#roll it up -- node
rollup -c ./build/rollup.config.js -o ./build/tmp.js

#concatenate d3 and topojson to js

cat ../js-modules/d3/d3.min.js \
./build/.newline.txt \
/home/alec/.local/lib/node-v7.0.0-linux-x64/lib/node_modules/topojson/dist/topojson.min.js \
./build/.newline.txt \
./build/tmp.js > app.js

#remove unnecessary files
rm ./build/.newline.txt ./build/tmp.js

#!/bin/sh
emcc pong.c -o pong.wasm -s WASM=1 -s ONLY_MY_CODE=1 -s SIDE_MODULE=1 -Oz -g
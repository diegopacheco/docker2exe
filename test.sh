#!/bin/bash

go build
./podman2bin --name redis74 --image redis:7.4.2-alpine
cd dist/
xattr -c redis74-darwin-arm64
./redis74-darwin-arm64 & PID=$! && sleep 1 && kill $PID
cd ../
rm -rf dist/
rm podman2bin
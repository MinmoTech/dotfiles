#!/bin/sh
set -eu

docker build --tag juligreen/archlinux-paru:latest ~/Projects/archlinux-paru-docker
docker push juligreen/archlinux-paru:latest
docker build --tag juligreen/archlinux-paru-python:latest ~/Projects/archlinux-paru-python
docker push juligreen/archlinux-paru-python:latest

cd ~/Projects/migaku/docker-archlinux-chrome/packer
packer build ./build.json.pkr.hcl

cd ~/Projects/migaku/unogs-scraper/
earthly +docker


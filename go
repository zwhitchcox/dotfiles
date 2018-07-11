#!/bin/bash
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh
sudo add-apt-repository ppa:gophers/archive -y
sudo apt-get update
sudo apt-get install golang-1.10-go -yqq

#!/bin/bash

# Update package list and install dependencies
sudo apt-get update
sudo apt-get install -y build-essential zlib1g-dev libssl-dev

# Download and extract OpenSSH 9.8p1
wget https://cdn.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.8p1.tar.gz
tar -xzf openssh-9.8p1.tar.gz
cd openssh-9.8p1

# Configure, compile, and install OpenSSH
./configure
make
sudo make install

# Restart SSH service
sudo systemctl restart ssh

# Verify the installed version
ssh -V

# Clean up: Remove the repository directory
cd ../..
rm -rf update-openSSH

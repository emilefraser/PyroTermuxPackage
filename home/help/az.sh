#!/bin/bash

pkg update
pkg install openssl libffi python clang make openssh nano

pip install --user virtualenv

#PATH=$PATH:~/.local/bin
#export PATH

virtualenv ~/.local/lib/azure-cli
cd ~/.local/lib/azure-cli
source ./bin/activate

pip install cffi
pip install azure-cli

az login

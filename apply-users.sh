#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/tjay/home.nix
popd

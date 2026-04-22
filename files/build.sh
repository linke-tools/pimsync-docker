#!/bin/bash

PIMSYNC_VERSION="v0.5.7"

# Install required packages
apt-get update
apt-get -y install ca-certificates curl git make libsqlite3-dev libsqlite3-0 build-essential scdoc gettext pkg-config

# Install rust
cd ~
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

# Build and install pimsync
git clone --branch "$PIMSYNC_VERSION" --depth 1 https://git.sr.ht/~whynothugo/pimsync pimsync
cd pimsync
git submodule update --init --recursive

make build
make install

mkdir /status

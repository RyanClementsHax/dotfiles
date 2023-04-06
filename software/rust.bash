#!/bin/bash

echo
echo "---------------"
echo "Installing Rust"
echo "---------------"
echo

curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y
sudo apt install build-essential
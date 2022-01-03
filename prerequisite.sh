#!/bin/bash

mkdir -p $HOME/.local/bin/
mkdir -p $HOME/.bang

cp bang $HOME/.bang
cp bang_conf $HOME/.bang
cp bang_gun $HOME/.bang
cp -r ./install/ $HOME/.bang

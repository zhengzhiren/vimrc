#!/bin/bash

THIS_DIR=$(dirname $(readlink -f $0))

echo Committing \"$HOME/.vimrc\" to git.

 
cp $HOME/.vimrc $THIS_DIR/
cd $THIS_DIR; git commit .vimrc; git push

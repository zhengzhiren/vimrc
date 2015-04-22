#!/bin/bash

THIS_DIR=$(dirname $(readlink -f $0))
cmd=$1

function update()
{
	echo Updating \"$HOME/.vimrc\"
	cd $THIS_DIR; git pull
    if [ -f $HOME/.vimrc ]; then
        cp $HOME/.vimrc $HOME/.vimrc.bak #make a backup
    fi  
	cp $THIS_DIR/.vimrc $HOME/.vimrc
}

function commit()
{
	echo Committing \"$HOME/.vimrc\" to git.
	cp $HOME/.vimrc $THIS_DIR/
	cd $THIS_DIR; git commit .vimrc; git push
}

case $cmd in
	update)
	update
	;;
	commit)
	commit
	;;	
	*)
	echo $"Usage: $0 {update|commit}"
esac

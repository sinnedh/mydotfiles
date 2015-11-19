#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

DIR=~/mydotfiles                    # dotfiles directory
OLDDIR=~/mydotfiles_old             # old dotfiles backup directory
FILES="bashrc vimrc vim"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
mkdir -p $OLDDIR
echo "...done"

# change to the dotfiles directory
echo "Changing to the $DIR directory"
cd $DIR
echo "...done"

# move and create symlinks
for FILE in $FILES; do
    echo "Moving any existing dotfiles from ~ to $OLDDIR"
    mv ~/.$FILE $OLDDIR
    echo "Creating symlink to $FILE in home directory."
    ln -s $DIR/$FILE ~/.$FILE
done

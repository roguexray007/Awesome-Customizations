#! /usr/bin/env zsh

# note - it is a zsh script . for an equivalent bash script convert 
# first line to /bin/sh or /usr/bin/env bash and replace zshrc with bashrc and exec /bin/bash
# this script creates a directory alias

#################### for running this script ####################
# cp da.sh /usr/local/bin/da
# chmod +x da
# goto any directory and run da . it will create an alias for that direcotry with alias named
# dir path without basename
# for custom alias name pass it while calling script. see help for syntax

Help()
{
   # Display Help
   echo "creates a directory alias"
   echo
   echo "Syntax: da <alias_name> [-h]"
   echo "options:"
   echo "h     Print this Help."
   echo
}

WORKING_DIRECTORY=$(pwd)

# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

if [ "$#" -ge 2 ]; then
    echo "You must enter 0 or 1 command line arguments"
    exit

elif [ "$#" -eq 1 ]; then
	ALIAS_NAME=$1
	echo "#adds alias for directory $WORKING_DIRECTORY" >> ~/.zshrc
	echo alias $ALIAS_NAME=\"cd $WORKING_DIRECTORY\" >> ~/.zshrc

else 
	echo "#adds alias for directory $WORKING_DIRECTORY" >> ~/.zshrc
	echo alias $(basename $WORKING_DIRECTORY)=\"cd $WORKING_DIRECTORY\" >> ~/.zshrc		
fi

exec /usr/local/bin/zsh

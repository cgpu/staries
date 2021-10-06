#!/bin/bash

#############################################################
# This is an example of parsing options and arguments. 
# https://www.livefirelabs.com/unix_tip_trick_shell_script/unix_shell_scripting/examples-of-how-to-pass-shell-script-arguments-using-shift-and-getopts.htm
#############################################################

C_OPT=0
DIR=`pwd`
VERSION="0.1Alpha"

while [ "$1" != "" ]; 
do
   case $1 in
    -c | --c_option )
        C_OPT=1
        ;;
    -v | --version )
        echo "Version: $VERSION"
        ;;
    -d | --directory )
        shift
        if [ -d "$1" ]
           then
             DIR="$1"
        else
           echo "$0: $1 is not a valid directory" >&2
           exit
        fi
        ;;
    -h | --help ) 
         echo "Usage: my_test [OPTIONS]"
         echo "OPTION includes:"
         echo "   -c | --c_option - flips the C_OPT variable from 0 to 1"
         echo "   -v | --version - prints out version information for this script"
         echo "   -d | --directory - requires user to specify a directory"
         echo "   -h | --help - displays this message"
         echo "   the command requires a filename argument"
         exit
      ;;
    * ) 
        echo "Invalid option: $1"
        echo "Usage: my_test [-c] [-v] [-d directory_name ]"
        echo "     -c flips the C_OPT variable from 0 to 1"
        echo "     -v prints out version information for this script"
        echo "     -d requires user to specify a directory"
        echo "     -h | --help - displays this message"
        echo "     the command requires a filename argument"
        exit
       ;;
  esac
  shift
done

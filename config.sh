#!/bin/sh

# Author: Alexander Duda, Thomas Roehr, thomas.roehr@dfki.de, Sylvain Joyeux
# This script sets up a git repository based on an existing template project

#Check for name of project
# Extract directory for config.sh

set -e

SCRIPT=$0
SCRIPT_DIR=`dirname $SCRIPT`
DIR=$SCRIPT_DIR
cd $DIR
DIR=`pwd`
# Extract Projectname
PACKAGE_DIR_NAME=`basename $DIR`

usage() {
    echo "usage: $0"
    echo "This script sets up a vizkit widget inside an already existing"
    echo "cmake package. It requests required information from the user when needed."
}

apply_template_value() {
    name=$1
    value=$2
    find . -type f -exec sed -i "s/$name/$value/g" {} \;
    find . -type f -name "*$name*" | while read path; do
        newpath=`echo $path | sed "s/$name/$value/g"`
        mv $path $newpath
    done
}

# If no arguments are given or help is requested
if [ "$1" = "-h" ] || [ "$1" = "--help" ]
	then usage
	exit 0
fi

if [ "$1" != "" ]; then
	usage
        exit 1
else
	PACKAGE_SHORT_NAME=$PACKAGE_DIR_NAME
fi

echo "Do you want to start the configuration of the vizkit plugin for project ${PACKAGE_SHORT_NAME}"

# Check and interprete answer of "Proceed [y|n]"
ANSWER=""
until [ "$ANSWER" = "y" ] || [ "$ANSWER" = "n" ] 
do
	echo "Proceed [y|n]"
	read ANSWER
	ANSWER=`echo $ANSWER | tr "[:upper:]" "[:lower:]"`
done

if [ "$ANSWER" = "n" ]
	then echo "Aborted."
	exit 0
fi

# Change into the operation directory
cd $DIR

# removing git references to prepare for new check in
rm -rf .git

echo "------------------------------------------"
echo "We require some information to create the widgte"
echo "------------------------------------------"
echo "a VizKit widget is essentially a qt designer widget that"
echo "can be used from ruby to build a gui"
echo
echo "What should be the class name (widget name) ? (Press ENTER when finished)"
read CLASS_NAME

apply_template_value project_name $PACKAGE_SHORT_NAME
apply_template_value ClassName $CLASS_NAME
# end of CMAKE-TEMPLATE-ADAPTION

#delete setup script
rm config.sh

git init
git add .
git commit -m "initial vizkit widget code"

echo "Done."


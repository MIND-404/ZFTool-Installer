#!/bin/sh
#
# Installer for ZFTool (Zend Framework 2 command line tool)
# 
# This shell script clones the latest ZFTool repository from github, installs
# it via composer and compiles ZFTool in a .phar file.
#
# Niklas Kosanke <niklas.kosanke@gmail.com>
# https://github.com/krystalkid/ZFTool-Installer
# v1.0 / 2013
#
# Usage
# -------------------------------------------------------------------------------
#
# Install ZFTool into working directory:
#	zftool.sh install
#
# Install ZFTool into specified directory:
#	zftool.sh install path <path>
#
# 	<path>	The directory where to install the ZFTool
#

printInfo() {

	echo ""
	echo "--------------------------------------------------------------------------------"
	echo "ZFTool Installer"
	echo "--------------------------------------------------------------------------------"
	echo ""
	echo "Install ZFTool into working directory:"
	echo "	zftool.sh install"
	echo ""
	echo "Install ZFTool into specified directory:"
	echo "	zftool.sh install path <path>"
	echo ""
	echo "	<path>	The directory where to install the ZFTool"
	echo ""
	echo "Reason for failure: "$msg
	echo ""
}

if [ $# -eq 0 ]; then
	msg="No arguments provided"
	printInfo
	exit 0
else
	if [ $# -gt 3 ]; then
		msg="Too many arguments provided"
		printInfo
		exit 1
	else
		if [ $1 != "install" ]; then
			msg=$1" is not a valid argument"
			printInfo
			exit 1
		fi
		if [ -n "$2" ]; then
			if [ $2 != "path" ]; then
				msg=$2" is not a valid argument"
				printInfo
				exit 1
			fi
			if [ -n "$3" ]; then
				if [ -d $3 ]; then
					installDir=$3
				else
					echo $3" is not an existing directory. Should it be created? (y/n)"
					read input
					if [ $input = "y" ]; then
						installDir=$3
						mkdir -p $installDir
						echo "Directory created successfully at "$installDir
					else
						exit 0
					fi
				fi
			else
				msg="No install directory specified"
				printInfo
				exit 1
			fi
		fi
	fi
fi

# if install directory is specified change working directory
[ -n "$installDir" ] && cd $installDir

# clone latest ZFTool repository from github into working directory
git clone git://github.com/zendframework/ZFTool.git

# change working directory to ZFTool
cd ZFTool

# download latest composer installer and install it locally into working directory
curl -sS https://getcomposer.org/installer | php

# resolve and download project dependencies as defined in ZFTool's composer.json
php composer.phar install

# compile ZFTool in a .phar file
bin/create-phar

echo ""
echo "It is recommended to add the ZFTool/bin directory to your PATH environment variable. This allows you to execute the zftool.phar wherever you are."

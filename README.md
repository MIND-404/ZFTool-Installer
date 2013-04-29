ZFTool-Installer
================

Installer for ZFTool (Zend Framework 2 command line tool) - This shell script clones the latest ZFTool repository from github, installs it via composer and compiles ZFTool in a .phar file.

Usage
=====

<b>Use curl to download ZFTool-Installer and install ZFTool</b>

curl -sS https://raw.github.com/krystalkid/ZFTool-Installer/master/zftool >  zftool.sh && zftool.sh install

<b>or if you want to specify an install directory</b>

curl -sS https://raw.github.com/krystalkid/ZFTool-Installer/master/zftool >  zftool.sh && zftool.sh install path &lt;path&gt;

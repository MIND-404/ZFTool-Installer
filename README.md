ZFTool-Installer
================

Installer for ZFTool (Zend Framework 2 command line tool) - This shell script clones the latest ZFTool repository from github, installs it via composer and compiles ZFTool in a .phar file.

Usage
=====

Use curl to download ZFTool-Installer and install ZFTool into your working directory

<code>curl -sS https://raw.github.com/krystalkid/ZFTool-Installer/master/zftool >  zftool.sh && zftool.sh install && rm zftool.sh</code>

or if you want to specify an install directory

<code>curl -sS https://raw.github.com/krystalkid/ZFTool-Installer/master/zftool >  zftool.sh && zftool.sh install path &lt;path&gt; && rm zftool.sh</code>

<br>
If you want to keep the installer file zftool.sh in your working directory omit the <b>&& rm zftool.sh</b> part at the end of the command line.

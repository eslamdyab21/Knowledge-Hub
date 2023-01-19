---
tags: 
- linux/basics
- programming
- course/devops


date: 2022-06-30
---

# Linux-commands

*   `pwd` print current working directory[![](Linux/Basics/Linux-commands-images/Untitled.png)Untitled.png)
    
*   `ls` list content

*   `cd` change directory

*   `mkdir` make a directory

*   `touch` create any file
    [![](Linux/Basics/Linux-commands-images/Untitled%201.png)tled%201.png)

*   `rm` remove files

*   `rm -r` remove folders, -r for recursively delete

*   `cd /` navigate to root directory
    [![](Linux/Basics/Linux-commands-images/Untitled%202.png)tled%202.png)

> note that everything in linux is a file, for example the above commands are files located in the `bin` directory.


*   `cd ~` navigate to home directory

*   `mv` move a folder from one directory to another, can be used to change the name of a folder too.
    [![](Linux/Basics/Linux-commands-images/Untitled%203.png)tled%203.png)

*   `cp -r` copy a folder

*   `ls -R` list content of a folder and the folders inside it (recursively)
    [![](Linux/Basics/Linux-commands-images/Untitled%204.png)tled%204.png)

*   `history` list all commands you typed, the commands are saved in .bash\_history file after closing the terminal
    [![](Linux/Basics/Linux-commands-images/Untitled%205.png)tled%205.png)

*   `ctrl + r` search for a specific command
    [![](Linux/Basics/Linux-commands-images/Untitled%206.png)tled%206.png)

*   `history + num ber` list last ‘number’ commands you typed
    [![](Linux/Basics/Linux-commands-images/Untitled%207.png)tled%207.png)

*   `cat file` displays content of file
    [![](Linux/Basics/Linux-commands-images/Untitled%208.png)tled%208.png)

*   `ls -a` list all files in a directory including hidden files

*   `uname -a` display os info
    
    [![](Linux/Basics/Linux-commands-images/Untitled%209.png)tled%209.png)

*   `cat /etc/os-release` display os release information
    [![](Linux/Basics/Linux-commands-images/Untitled%2010.png)led%2010.png)

*   `lscpu` list cpu info
    [![](Linux/Basics/Linux-commands-images/Untitled%2011.png)led%2011.png)

*   `lsmem` list memory info
    [![](Linux/Basics/Linux-commands-images/Untitled%2012.png)led%2012.png)

*   `sudo addusr name` add a user (needs to run as root)
    [![](Linux/Basics/Linux-commands-images/Untitled%2013.png)led%2013.png)

*   `su - name` switch user
    [![](Linux/Basics/Linux-commands-images/Untitled%2014.png)led%2014.png)

*   `sudo addgroup name` add a group
    [![](Linux/Basics/Linux-commands-images/Untitled%2015.png)led%2015.png)
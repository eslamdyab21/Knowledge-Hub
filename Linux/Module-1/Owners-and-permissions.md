---
tags: 
- linux
- programming
- course/devops

course:
- devops
- module1

date: 2022-06-30
---


# Owners-and-permissions


Ownership
---------

*   the user who created a file is the owner of that file, and the primary group of that user is the primary group of that file. and `ls -l` displays the ownership and permissions info.
    
    [![](Owners-and-permissions-images/Untitled.png)](Owners-and-permissions-images/Untitled.png)
    
    here we created a text file called `info.txt` with eslamdyab21 user and eslamdyab21 group, because we currently logged as that user. `eslamdyab21@cloudshell:~/p0 (rextes)`
    

*   if we switch to tom user whose primary group is devops, its info will be displayed
    
    [![](Owners-and-permissions-images/Untitled%201.png)](Owners-and-permissions-images/Untitled%201.png)
    

*   we can change the owner user and group of a file, `sudo chown user:group file`
    
    [![](Owners-and-permissions-images/Untitled%202.png)](Owners-and-permissions-images/Untitled%202.png)
    

*   `ls -l /etc/` see who owns the files in etc
    
    [![](Owners-and-permissions-images/Untitled%203.png)](Owners-and-permissions-images/Untitled%203.png)
    
    they are owned by root because they are system files which are created by the system itself.
    

*   `sudo chown user file` change only the user owner of a file
    
    [![](Owners-and-permissions-images/Untitled%204.png)](Owners-and-permissions-images/Untitled%204.png)
    

*   `sudo chgrp group file` change only the group owner of a file
    
    [![](Owners-and-permissions-images/Untitled%205.png)](Owners-and-permissions-images/Untitled%205.png)
    

Permissions
-----------

[![](Owners-and-permissions-images/Untitled%206.png)](Owners-and-permissions-images/Untitled%206.png)

*   r —> read

*   w —> write

*   x —> execute

*   d —> directory

[![](Owners-and-permissions-images/Untitled%207.png)](Owners-and-permissions-images/Untitled%207.png)

here if we look at `main.py`

`-rwx``r--``r--` `1 eslamdyab21 eslamdyab21 48 Jun 29 13:13 main.py`

*   the owner user (eslamdyab21) has read, write and execute permissions

*   the owner group (eslamdyab21) has read permissions only

*   the other groups has read permissions only

this means only eslamdyab21 user can modify and run this script.

[![](Owners-and-permissions-images/Untitled%208.png)](Owners-and-permissions-images/Untitled%208.png)

if we switch to tom user:

[![](Owners-and-permissions-images/Untitled%209.png)](Owners-and-permissions-images/Untitled%209.png)

to give tom write permissions we need to change the permissions for the other group (which includes devops group which tom is in)

*   u for user

*   g for group

*   o for other

*   a for all

*   `sudo chmod o+w file`
    
    [![](Owners-and-permissions-images/Untitled%2010.png)](Owners-and-permissions-images/Untitled%2010.png)
    
    now we can edit the file in other groups
    

*   `sudo chmod o-w file` to take the write permission from other groups
    
    [![](Owners-and-permissions-images/Untitled%2011.png)](Owners-and-permissions-images/Untitled%2011.png)
    

*   `sudo chmod g+w file` add write permission to eslamdyab21 group
    
    [![](Owners-and-permissions-images/Untitled%2012.png)](Owners-and-permissions-images/Untitled%2012.png)
    

*   `sudo chmod a+r file` add read permission for all users
    
    [![](Owners-and-permissions-images/Untitled%2013.png)](Owners-and-permissions-images/Untitled%2013.png)
    

*   we can specify all the permissions at once `sudo chmod o=rwx file`
    
    [![](Owners-and-permissions-images/Untitled%2014.png)](Owners-and-permissions-images/Untitled%2014.png)
    
    [![](Owners-and-permissions-images/Untitled%2015.png)](Owners-and-permissions-images/Untitled%2015.png)
    

we can change the permission for the user, group and other in one command using the binary method

[![](Owners-and-permissions-images/Untitled%2016.png)](Owners-and-permissions-images/Untitled%2016.png)

*   `sudo chmod 754 file`
    
    *   1st digit 7=111 —> r=1, w=1, x=1 —> for user
    
    *   2nd digit 5=101 —> r=1, w=0, x=1 —> for group
    
    *   3rd digit 4=100 —> r=1, w=0, x=1 —> for other
    
    [![](Owners-and-permissions-images/Untitled%2017.png)](Owners-and-permissions-images/Untitled%2017.png)
    

💡

Note: we can do the same for hidden files with `ls -la`

[![](Owners-and-permissions-images/Untitled%2018.png)](Owners-and-permissions-images/Untitled%2018.png)
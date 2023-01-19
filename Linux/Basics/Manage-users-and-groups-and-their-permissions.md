---
tags: 
- linux/basics
- programming
- course/devops


date: 2022-06-30
---

# Manage-users-and-groups-and-their-permissions

[![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled.png)Untitled.png)

her there is only one user and its name is `htb-ac480198`


*   we can see the users and their assigned groups in `/etc/passwd`
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%201.png)tled%201.png)[![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%202.png)tled%202.png)
  
  we can see `htb-ac480198:x:1000:1003:,,,:/home/htb-ac480198:/bin/bash` where
  
  -   `htb-ac480198` is the user name ,
  -   `x` is the password and its represented as x for security
  *   `1000` is the user id, assigned automatically when creating the user. and each user has a unique id
  *   `1003` is the group id that this user is in, and is stored in /etc/group
  *   `/home/htb-ac480198:` is the user home directory
  *   `/bin/bash` path of user shell


*   `adduser username` to add a user
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%203.png)tled%203.png)
    
    *   note that the user id and the group id get assigned automatically
    
    *   we can see that the user has been added in `/etc/passwd` with `UID=1001` and `GID=1004` and assigned a new directory `/home/tom` in the home directory
        
        [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%204.png)tled%204.png)
        
        [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%205.png)tled%205.png)
        
    

💡Note: whenever we create a new user, a new group is created automatically (primary group) to 
    that user with the same name as the user name and with a unique GID

*   `sudo passwd username` change the password of a user
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%206.png)tled%206.png)
    

*   `su - username` switch to another user
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%207.png)tled%207.png)

*   `sudo groupadd groupName` add a group
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%208.png)tled%208.png)[![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%209.png)tled%209.png)
    
    we can see `devops:x:1005` is added

*   `sudo usermod -g anotherPrimaryGroup username` change the primary group of a user to another group
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%2010.png)led%2010.png)[![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%2011.png)led%2011.png)
    *   we can see the GID is changed from 1004 to 1005 which is the GID of devops group
    
    *   now we don’t need the tom group, we can delete it `sudo delgroup tom`
        
        [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%2012.png)led%2012.png)
        
    

💡Note: we can add a user to multiple groups (a secondary group in addition to the primary group) 
    and that user will have the permissions of all the groups that he is in.

*   `sudo usermod -G secondrGgroup username` add the user to a secondary group in addition to the primary group, `secondrGgroup` can be one or a list (g1,g2,g3,…)
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%2013.png)led%2013.png)

*   note that if we add another `secondrGgroup` with the above command the `secondrGgroup`will be overwritten[![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%2014.png)led%2014.png)

*   `sudo usermod -aG secondrGgroup username` to append to the existing `secondrGgroup`s.
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%2015.png)led%2015.png)
    

*   `groups username` displays the groups assigned to a user

*   we can add a user to a specific primary group a the creation of a new user instead of adding the primary group after the creation and then deleting the automatically created group
    
    *   `sudo useradd -g devops niklaus`
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%2016.png)led%2016.png)


*   `sudo gpasswd -d username group` delete a user from a group
    [![](Linux/Basics/Manage-users-and-groups-and-their-permissions-images/Untitled%2017.png)led%2017.png)

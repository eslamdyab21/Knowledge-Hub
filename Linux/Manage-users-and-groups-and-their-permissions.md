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


[![](Manage-users-and-groups-and-their-permissions-images/Untitled.png)](Manage-users-and-groups-and-their-permissions-images/Untitled.png)

her there is only one user and its name is `htb-ac480198`


*   we can see the users and their assigned groups in `/etc/passwd`
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%201.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%201.png)[![](Manage-users-and-groups-and-their-permissions-images/Untitled%202.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%202.png)
  
  we can see `htb-ac480198:x:1000:1003:,,,:/home/htb-ac480198:/bin/bash` where
  
  -   `htb-ac480198` is the user name ,
  -   `x` is the password and its represented as x for security
  *   `1000` is the user id, assigned automatically when creating the user. and each user has a unique id
  *   `1003` is the group id that this user is in, and is stored in /etc/group
  *   `/home/htb-ac480198:` is the user home directory
  *   `/bin/bash` path of user shell


*   `adduser username` to add a user
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%203.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%203.png)
    
    *   note that the user id and the group id get assigned automatically
    
    *   we can see that the user has been added in `/etc/passwd` with `UID=1001` and `GID=1004` and assigned a new directory `/home/tom` in the home directory
        
        [![](Manage-users-and-groups-and-their-permissions-images/Untitled%204.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%204.png)
        
        [![](Manage-users-and-groups-and-their-permissions-images/Untitled%205.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%205.png)
        
    

💡Note: whenever we create a new user, a new group is created automatically (primary group) to 
    that user with the same name as the user name and with a unique GID

*   `sudo passwd username` change the password of a user
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%206.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%206.png)
    

*   `su - username` switch to another user
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%207.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%207.png)

*   `sudo groupadd groupName` add a group
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%208.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%208.png)[![](Manage-users-and-groups-and-their-permissions-images/Untitled%209.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%209.png)
    
    we can see `devops:x:1005` is added

*   `sudo usermod -g anotherPrimaryGroup username` change the primary group of a user to another group
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%2010.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%2010.png)[![](Manage-users-and-groups-and-their-permissions-images/Untitled%2011.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%2011.png)
    *   we can see the GID is changed from 1004 to 1005 which is the GID of devops group
    
    *   now we don’t need the tom group, we can delete it `sudo delgroup tom`
        
        [![](Manage-users-and-groups-and-their-permissions-images/Untitled%2012.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%2012.png)
        
    

💡Note: we can add a user to multiple groups (a secondary group in addition to the primary group) 
    and that user will have the permissions of all the groups that he is in.

*   `sudo usermod -G secondrGgroup username` add the user to a secondary group in addition to the primary group, `secondrGgroup` can be one or a list (g1,g2,g3,…)
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%2013.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%2013.png)

*   note that if we add another `secondrGgroup` with the above command the `secondrGgroup`will be overwritten[![](Manage-users-and-groups-and-their-permissions-images/Untitled%2014.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%2014.png)

*   `sudo usermod -aG secondrGgroup username` to append to the existing `secondrGgroup`s.
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%2015.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%2015.png)
    

*   `groups username` displays the groups assigned to a user

*   we can add a user to a specific primary group a the creation of a new user instead of adding the primary group after the creation and then deleting the automatically created group
    
    *   `sudo useradd -g devops niklaus`
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%2016.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%2016.png)


*   `sudo gpasswd -d username group` delete a user from a group
    [![](Manage-users-and-groups-and-their-permissions-images/Untitled%2017.png)](Manage-users-and-groups-and-their-permissions-images/Untitled%2017.png)

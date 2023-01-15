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


>in linux commands, the output of one command can be the input to another command. This is known as piping

Pipelines with less
----------------------------------------------

for example `cat /var/log/syslog` output the log data in the shell directly, but it’s not user friendly because it outputs all the data in one big page.

a tool called `less` can take this data and displays it in different pages making it easier to read.

[![](Pipelines-images/cat_logg.gif)](Pipelines-images/cat_logg.gif)

*   `cat /var/log/syslog | less` pipline that pass the output of cat to the input to less
    [![](Pipelines-images/cat_log_less.gif)](Pipelines-images/cat_log_less.gif)
    
    type `q` to quite, `b` to navigate up, `space` to navigate down

*   `history | less`
    [![](Pipelines-images/history_less.gif)](Pipelines-images/history_less.gif)




Pipelines with grep
-------------------------------------------------

*   `history | grep “sudo chmod”` filter the history to find lines which have “`sudo chmod`” in them.
    [![](Pipelines-images/Untitled.png)](Pipelines-images/Untitled.png)

*   `history | grep sudo | less`
    [![](Pipelines-images/grep_less.gif)](Pipelines-images/grep_less.gif)

*   `cat README-cloudshell.txt | grep cloud`
    [![](Pipelines-images/grep_cloud.gif)](Pipelines-images/grep_cloud.gif)
    

Redirecting
------------------------------

*   `history | grep sudo > sudo-commands.txt`
    [![](Pipelines-images/redirect.gif)](Pipelines-images/redirect.gif)


#### If we want to append to a copy of `sudo-commands.txt`,
*   `history | grep tom` `>>` `sudo-tom-commands.txt`
    [![](Pipelines-images/tom.gif)](Pipelines-images/tom.gif)


>Note: the above methods are useful in a scenario when we filter the log file for a particular application and direct/save this log info to a file to share with someone for troubleshooting

*   `ls; sleep 2; echo "Hi after waiting and ls”`
    [![](Pipelines-images/sleep.gif)](Pipelines-images/sleep.gif)
    those commands are independent of each other, no piping no redirecting
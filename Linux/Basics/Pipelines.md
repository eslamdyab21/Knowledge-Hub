---
tags: 
- linux/basics
- programming
- course/devops


date: 2022-06-30
---


# Pipelines

>in linux commands, the output of one command can be the input to another command. This is known as piping

Pipelines with less
----------------------------------------------

for example `cat /var/log/syslog` output the log data in the shell directly, but it’s not user friendly because it outputs all the data in one big page.

a tool called `less` can take this data and displays it in different pages making it easier to read.

[![](cat_logg.gif)og/syslog | less` pipline that pass the output of cat to the input to less
    [![](cat_log_less.gif)` to quite, `b` to navigate up, `space` to navigate down

*   `history | less`
    [![](history_less.gif)th grep
-------------------------------------------------

*   `history | grep “sudo chmod”` filter the history to find lines which have “`sudo chmod`” in them.
    [![](Linux/Basics/Pipelines-images/Untitled.png)Untitled.png)

*   `history | grep sudo | less`
    [![](grep_less.gif)-cloudshell.txt | grep cloud`
    [![](grep_cloud.gif)g
------------------------------

*   `history | grep sudo > sudo-commands.txt`
    [![](redirect.gif)t to append to a copy of `sudo-commands.txt`,
*   `history | grep tom` `>>` `sudo-tom-commands.txt`
    [![](tom.gif)ve methods are useful in a scenario when we filter the log file for a particular application and direct/save this log info to a file to share with someone for troubleshooting

*   `ls; sleep 2; echo "Hi after waiting and ls”`
    [![](sleep.gif)ds are independent of each other, no piping no redirecting
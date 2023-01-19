---
tags: 
- linux/basics
- programming
- course/devops


date: 2022-06-30
---

# Environment-variables


### Intro to environment variables

*   environment variables are a set of dynamic named values, stored within the system that are used by applications launched in shells. In simple words, an environment variable is a variable with a name and an associated value

*   `printenv` print all system env var
    
    ![](Environment-Variables-images/Untitled.png)
    
    ![](Environment-Variables-images/Untitled%201.png)
    

*   `printenv VAR` print the value of VAR environment variable
    [![](Environment-Variables-images/Untitled%202.png)
    

*   environment variables can be accessed by linux programs and commands and also programming languages by typing $ before the variable `$USER` just like in bash script
    [![](Environment-Variables-images/Untitled%203.png)

### Benefits of environment variables

Note that environment variables are not only a way for the os to store some info, it has other important use cases, like when running an application on a linux server which connects to google api, this connection have credentials (username and password).

how can we provide this sensitive credentials info in a secure way? we can’t just put them in our program in plain sight for anyone to see.

[![](Environment-Variables-images/Untitled%204.png)

the answer is using environment variables, the application can access the sensitive data without showing them, we create an environment variables for every sensitive data entry.

[![](Environment-Variables-images/Untitled%205.png)

also environment variables are used to make applications more flexible

[![](Environment-Variables-images/Untitled%206.png)

### Operations on environment variables

*   `export ENV_VAR=value` creating env var

*   `unset ENV_VAR` deletes env var

[![](Environment-Variables-images/Untitled%207.png)

💡Note that if we closed this terminal the created env vars will be gone, to save them permanently 
    we need to add export commands in the `.bashrc` file and then source it.

[![](Environment-Variables-images/Untitled%208.png)

[![](Environment-Variables-images/Untitled%209.png)

💡Note that the above `.bashrc` is unique for each user, which means that the env vars we created 
    won’t be accessible by other users. however we can make them global to all users by adding them in the `.bashrc` of the root which is located in `/etc/environment`

### The PATH environment variable

[![](Environment-Variables-images/Untitled%2010.png)

is a list of directories to executable files separated by :

it tells the shell which directories to search for for the executables that we write in our commands

ex: when we type `ls` command, the shell searches in every directory in the PATH env var (every element in the list) until it finds it to execute it.

so if we added a directory of a new created exeuteble file to the PATH env var, we can execute it like `ls` anywhere.

Use case for me will be to save the github token in an env var.

*   Adding a custom command/program to the PATH env var
    
    *   creating the new script
        
        [![](Environment-Variables-images/Untitled%2011.png)
        
    
    *   adding it to the PATH env var
    
    [![](Environment-Variables-images/Untitled%2012.png)
    
    note that we didn’t use export with PATH because it’s already an existing env var, we’re just changing it
    
    [![](Environment-Variables-images/Untitled%2013.png)
    

so the benefit here is that instead of specifying the entire path `/home/eslamdyab21/p0/welcome.sh` we just type `welcome.sh` anywhere

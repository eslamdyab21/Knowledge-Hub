---
tags: 
- linux/basics
- programming
- course/devops


date: 2022-06-30
---

# Bash-scripting



[Variables](#Variables)

[Conditions](#Conditions)

[Numeric compactors](#90725ef0-b056-49c9-bbcd-4a1cc42752fe)

[String operations](#b99b9d61-2b57-4696-b700-1a1bd96e7c5e)

[Passing arguments to a script](#25368090-6f2d-4aac-a364-8df251908143)

[Reading user input](#29cb6cd4-a09b-4600-b2de-cf8b39358e51)

[Loops](#2bdd13f6-5cb7-4cec-a63b-7829cc87681d)

[Functions](#6db1a98f-b7a7-4ff3-963f-2a99621f3afa)

*   it’s a way to execute more than one command together. the commands are written in bash files `file.sh` , the first line (shebang #!) must reference the bash location, by default it’s `#!/bin/bash` . to run the bash file: `./file.sh` or `bash file.sh` or `/bin/bash file.sh` 
    
    [![](Linux/Basics/Bash-scripting-images/Untitled.png)
    
    [![](Linux/Basics/Bash-scripting-images/Untitled%201.png)
    
</br>
</br>

### Variables

*   `file_name= config.yaml` variable in bash

*   `files = $(ls p0)` save the output of a command to a variable

[![](Linux/Basics/Bash-scripting-images/Untitled%202.png)tled%202.png)

[![](Linux/Basics/Bash-scripting-images/Untitled%203.png)tled%203.png)

</br>
</br>

### Conditions
```bash
if [condition]
then
	statement
else
	statement
fi
```

```bash
#!/bin/bash
echo "this isthe first line command in bash"

file_name=config.yaml

if [ -d "config" ]
then
   echo "reading config directory conternt"
   config_files=$(ls config)
else
   echo "config dir not found, creating one"
   mkdir config
fi



echo "using file $file_name to configure something"

echo "here are all files inside config dir: $config_files"
```


[![](Linux/Basics/Bash-scripting-images/Untitled%204.png)tled%204.png)

[![](Linux/Basics/Bash-scripting-images/Untitled%205.png)tled%205.png)

`-d` in if condition is a `file test operator` which checks if a directory exists or not. And there are other test operators:

[![](Linux/Basics/Bash-scripting-images/Untitled%206.png)]

</br>
</br>

### Numeric compactors

[![](Linux/Basics/Bash-scripting-images/Untitled%207.png)tled%207.png)

*   `if [ “$num_files” -eq 10]`

</br>
</br>

### String operations

[![](Linux/Basics/Bash-scripting-images/Untitled%208.png)tled%208.png)

[![](Linux/Basics/Bash-scripting-images/Untitled%209.png)tled%209.png)

</br>
</br>

### Passing arguments to a script

[![](Linux/Basics/Bash-scripting-images/Untitled%2010.png)led%2010.png)

```bash
    #!/bin/bash
    
    file_name=$1
    
    config_dir=$2
    
    echo "-----------------"
    if [ -d "$config_dir" ]
    then
       echo "reading config directory conternt"
       config_files=$(ls $config_dir)
    else
       echo "config dir not found, creating one"
       mkdir $config_dir
       touch $config_dir/config.sh
       config_files=$(ls $config_dir)
    fi
    
    
    echo "-------------------"
    echo "using file $file_name to configure something"
    echo "-------------------"
    
    echo "here are all files inside config dir: $config_files"
```

[![](Linux/Basics/Bash-scripting-images/Untitled%2011.png)led%2011.png)

*   there are two special parameters which allow us to store all the user input parameters `$*`, and their number `$#`
    
    [![](Linux/Basics/Bash-scripting-images/Untitled%2012.png)led%2012.png)
    
    [![](Linux/Basics/Bash-scripting-images/Untitled%2013.png)led%2013.png)
    
</br>
</br>

### Reading user input

[![](Linux/Basics/Bash-scripting-images/Untitled%2014.png)led%2014.png)

[![](Linux/Basics/Bash-scripting-images/Untitled%2015.png)led%2015.png)

</br>
</br>

### Loops

[![](Linux/Basics/Bash-scripting-images/Untitled%2016.png)led%2016.png)

[![](Linux/Basics/Bash-scripting-images/Untitled%2017.png)led%2017.png)

* loop with if
![](Linux/Basics/Bash-scripting-images/Untitled%2018.png)
```bash
#!/bin/bash
echo "all params: $*"
echo "number of params: $#"
echo " "

for param in $*
do
  if [ -d "$param" ]
  then
	echo "$param is a directory, printing its content: "
	ls $param
	echo " "
  fi
done
```
    
![](Untitled%2019.png)

</br>
</br>

* while 

![](Untitled%2020.png)

```bash
#!/bin/bash

sum=0
while true
do
   read -p "enter a score: " score

   if [ "$score" == "q" ]
   then
	  echo " "
	  echo "Quiting....."
	  break
   fi

   sum=$(($sum+$score))
   echo "total score: $sum"
done
```

    
[![](Untitled%2021.png) `sum=$(($sum+$score))` if we typed it like this `sum=$sum+$score` it will concatenate two strings

</br>
</br>

### Functions

[![](Untitled%2022.png)ng)024.png)
function sum(){
   total=$(($1+$2))
   return $total
}

sum 2 10
result=$?
# above two lines same as result=$(sum 2 10)

echo "2 + 10 = $result"
echo " "
echo "----------------------------"


function create_file() {
   file_name=$1
   is_shell_script=$2

   touch $file_name
   echo " file $file_name created"

   if [ "$is_shell_script" = true ]
   then
	  chmod u+x $file_name
	  echo "added execute permission"
   fi
   echo " "
}

create_file test.txt
create_file con.yaml
create_file script.sh true
```

[![](Untitled%2025.png)
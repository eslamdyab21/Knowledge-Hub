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


# Vim-editor


Basics
-----------------
*   install vim `sudo apt install vim`

*   `vim file` opens a file in a `command mode` , in command mode you can’t edit the file, but you can do anything else like navigate, search,delete, undo,…..

*   `vim` `readme.md`
    [![](Vim-editor-images/Untitled.png)](Vim-editor-images/Untitled.png)

*   to insert text type `i` to switch to the insert mode
    [![](Vim-editor-images/Untitled%201.png)](Vim-editor-images/Untitled%201.png)
    
    [![](Vim-editor-images/Untitled%202.png)](Vim-editor-images/Untitled%202.png)
    

*   to save the edit we need to go back to common mode first and then exit, to go back to common mode type `esc key` , then type `:wq` (write and quite) to write the changes and quite.
    [![](Vim-editor-images/Untitled%203.png)](Vim-editor-images/Untitled%203.png)
    
    [![](Vim-editor-images/Untitled%204.png)](Vim-editor-images/Untitled%204.png)

*   if you added some text and you want to quit without saving the changes you made, go to common mode and type `:q!`
    [![](Vim-editor-images/Untitled%205.png)](Vim-editor-images/Untitled%205.png)
    
    [![](Vim-editor-images/Untitled%206.png)](Vim-editor-images/Untitled%206.png)

*   `vim file` creates a file

Some useful commands/shortcuts
----------------------------------------------------------------------------------------

[![](Vim-editor-images/Untitled%207.png)](Vim-editor-images/Untitled%207.png)

*   to delete a line you can type `dd` in common mode instead of deleting character by character.

*   to delete next N lines, type `dNd` like deleting next 4 lines `d4d`
    [![](Vim-editor-images/Untitled%208.png)](Vim-editor-images/Untitled%208.png)

*   to undo type `u`
    [![](Vim-editor-images/Untitled%207.png)](Vim-editor-images/Untitled%207.png)

*   to jump to the end of the line type capital A `Shift + A` and it will switch to insert mode too.

*   to jump to the beginning of the line type `0`

*   to jump to line number N type NG like jumping to line number 12, type `12G`

*   to search for a word in the file type `/word` and it will find the first match, to go to the next match type `n`, to go to the previous match type `N`
    [![](Vim-editor-images/Untitled%209.png)](Vim-editor-images/Untitled%209.png)
    

*   to replace a string who is frequent like nginx with another, type `:%s/stringName/newName` like `:%s/nginx/new-app`
    [![](Vim-editor-images/Untitled%2010.png)](Vim-editor-images/Untitled%2010.png)
    
    [![](Vim-editor-images/Untitled%2011.png)](Vim-editor-images/Untitled%2011.png)
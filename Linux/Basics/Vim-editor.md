---
tags: 
- linux/basics
- programming
- course/devops


date: 2022-06-30
---


# Vim-editor


Basics
-----------------
*   install vim `sudo apt install vim`

*   `vim file` opens a file in a `command mode` , in command mode you can’t edit the file, but you can do anything else like navigate, search,delete, undo,…..

*   `vim` `readme.md`
    [![](Linux/Basics/Vim-editor-images/Untitled.png)Untitled.png)

*   to insert text type `i` to switch to the insert mode
    [![](Linux/Basics/Vim-editor-images/Untitled%201.png)tled%201.png)
    
    [![](Linux/Basics/Vim-editor-images/Untitled%202.png)tled%202.png)
    

*   to save the edit we need to go back to common mode first and then exit, to go back to common mode type `esc key` , then type `:wq` (write and quite) to write the changes and quite.
    [![](Linux/Basics/Vim-editor-images/Untitled%203.png)tled%203.png)
    
    [![](Linux/Basics/Vim-editor-images/Untitled%204.png)tled%204.png)

*   if you added some text and you want to quit without saving the changes you made, go to common mode and type `:q!`
    [![](Linux/Basics/Vim-editor-images/Untitled%205.png)tled%205.png)
    
    [![](Linux/Basics/Vim-editor-images/Untitled%206.png)tled%206.png)

*   `vim file` creates a file

Some useful commands/shortcuts
----------------------------------------------------------------------------------------

[![](Linux/Basics/Vim-editor-images/Untitled%207.png)tled%207.png)

*   to delete a line you can type `dd` in common mode instead of deleting character by character.

*   to delete next N lines, type `dNd` like deleting next 4 lines `d4d`
    [![](Linux/Basics/Vim-editor-images/Untitled%208.png)tled%208.png)

*   to undo type `u`
    [![](Linux/Basics/Vim-editor-images/Untitled%207.png)tled%207.png)

*   to jump to the end of the line type capital A `Shift + A` and it will switch to insert mode too.

*   to jump to the beginning of the line type `0`

*   to jump to line number N type NG like jumping to line number 12, type `12G`

*   to search for a word in the file type `/word` and it will find the first match, to go to the next match type `n`, to go to the previous match type `N`
    [![](Linux/Basics/Vim-editor-images/Untitled%209.png)tled%209.png)
    

*   to replace a string who is frequent like nginx with another, type `:%s/stringName/newName` like `:%s/nginx/new-app`
    [![](Linux/Basics/Vim-editor-images/Untitled%2010.png)led%2010.png)
    
    [![](Linux/Basics/Vim-editor-images/Untitled%2011.png)led%2011.png)
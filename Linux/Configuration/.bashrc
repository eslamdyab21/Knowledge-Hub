#chang# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

debian_chroot=${debian_chroot%?}
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi


color_prompt=yes
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\\[\033[0;95m\]\$(parse_git_branch)\[\033[0m\]$ "
export CLICOLOR=1    
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

#PS1="$PS1 $(parse_git_branch)\[\033[0m"

#PS1=${PS1%?}
PS1="$PS1 \n❯ "


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
   fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi
#source /opt/ros/noetic/setup.bash

export GHT=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
#neofetch
~/Downloads/pfetch/./pfetch
#source ~/.local/share/blesh/ble.sh

#export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
#if [[ -f $THEME ]]; then
#    export DEFAULT_USER=`whoami`
#    source $THEME
#fi

export PATH=:/opt/ros/noetic/bin:/bin:/home/dyab/.local/bin:/usr/sbin:/usr/local/bin:/snap/bin
#export PATH=:/opt/ros/noetic/bin:/bin
export PATH=$PATH:/home/dyab/Embeded/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux/gcc-arm-none-eabi-10.3-2021.10/bin

export PATH=$PATH:$HOME/.dotnet/sdk/6.0.302/DotnetTools
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT



# print the git branch name if in a git project
#parse_git_branch() {
#  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)//'
#}
# set the input prompt symbol
#ARROW="❯"
# define text formatting
#PROMPT_BOLD="$(tput bold)"
#PROMPT_UNDERLINE="$(tput smul)"
#PROMPT_FG_GREEN="$(tput setaf 2)"
#PROMPT_FG_CYAN="$(tput setaf 6)"
#PROMPT_FG_YELLOW="$(tput setaf 3)"
#PROMPT_FG_MAGENTA="$(tput setaf 5)"
#PROMPT_RESET="$(tput sgr0)"
# save each section prompt section in variable
#PROMPT_SECTION_SHELL="\[$PROMPT_BOLD$PROMPT_FG_GREEN\]\s\[$PROMPT_RESET\]"
#PROMPT_SECTION_DIRECTORY="\[$PROMPT_UNDERLINE$PROMPT_FG_CYAN\]\W\[$PROMPT_RESET\]"
#PROMPT_SECTION_GIT_BRANCH="\[$PROMPT_FG_YELLOW\]\`parse_git_branch\`\[$PROMPT_RESET\]"
#PROMPT_SECTION_ARROW="\[$PROMPT_FG_MAGENTA\]$ARROW\[$PROMPT_RESET\]"
# set the prompt string using each section variable

#PS1=${PS1%?}
#PS1=${PS1%?}\n'> '

#ADD_TO_PS1="
#🎄 $PROMPT_SECTION_SHELL ❄️  $PROMPT_SECTION_DIRECTORY 🎁 $PROMPT_SECTION_GIT_BRANCH 🌟
#$PROMPT_SECTION_ARROW "

#PS1="$PS1 ❄️ $PROMPT_SECTION_GIT_BRANCH"
#PS1=${PS1%?}
#PS1=${PS1%?}\n'❯ '


# You might want to add this to your .bash_profile and/or .bashrc file in your home directory 
#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

#export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\\[\033[0;95m\]\$(parse_git_branch)\[\033[0m\]$ "
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad
#alias ls='ls -GFh'
source /opt/ros/noetic/setup.bash
source /opt/ros/noetic/setup.bash


#export ROS_MASTER_URI=http://localhost:11311
#export ROS_IP=localhost
#export ROS_HOSTNAME=localhost
export ROS_MASTER_URI=http://192.168.1.9:11311
#export ROS_IP=192.168.1.33

#export ROS_MASTER_URI=http://10.42.0.51:11311
export ROS_IP=192.168.1.33
export ROS_HOSTNAME=192.168.1.33

alias sdn='sudo shutdown now'

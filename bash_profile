# ~/.bash_profile: executed by bash(1) for login shells.
PATH="/opt/local/sbin:/opt/local/lib/postgresql83/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}:/Users/chaodyne/bin"
export PATH
export VMAIL_VIM=mvim

# include .bashrc
source ~/.bashrc

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Add git completion
source ~/.git-completion.bash

# Adds current Git branch to the prompt
function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

PS1="${TITLEBAR}\
$GREEN[$BLUE\$(date +%H:%M)$GREEN]\
$GREEN[$BLUE\u@\h:\w$GREEN\$(parse_git_branch)$GREEN]\
$LIGHT_GRAY\$ "
PS2='> '
PS4='+ '
}
proml


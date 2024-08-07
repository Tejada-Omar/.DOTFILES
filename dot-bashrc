#!/bin/bash
# shellcheck source=/home/omar/.bash_env
source ~/.bash_env

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\W \$ '

# shellcheck source=/home/omar/.bash_aliases
source ~/.bash_aliases
if [ -z "$BASH_EXECUTION_STRING" ]; then exec fish; fi

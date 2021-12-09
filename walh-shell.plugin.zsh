#!/usr/bin/env zsh
#
WALH_SHELL=$(dirname ${(%):-%x})
[ -n "$PS1" ] && [ -s $WALH_SHELL/profile_helper.sh ] && eval "$($WALH_SHELL/profile_helper.sh)"

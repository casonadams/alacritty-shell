#!/usr/bin/env zsh

export _ALACRITTY_SHELL=$(dirname "${(%):-%x}")

[ -n "$PS1" ] \
  && [ -s "${_ALACRITTY_SHELL}/profile_helper.sh" ] \
  && eval "$("${_ALACRITTY_SHELL}/profile_helper.sh")"

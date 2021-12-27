#!/usr/bin/env zsh

ALACRITTY_SHELL=$(dirname "${(%):-%x}")

[ -n "$PS1" ] \
    && [ -s "${ALACRITTY_SHELL}/profile_helper.sh" ] \
    && eval "$("${ALACRITTY_SHELL}/profile_helper.sh")"

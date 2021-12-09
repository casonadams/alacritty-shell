#!/usr/bin/env bash

# Normal
color00="fb/f1/c7" # Black
color01="9d/00/06" # Red
color02="79/74/0e" # Green
color03="b5/76/14" # Yellow
color04="07/66/78" # Blue
color05="8f/3f/71" # Magenta
color06="42/7b/58" # Cyan
color07="50/49/45" # White

# Bright
color08="bd/ae/93" # Bright Black
color09="9d/00/06" # Red
color10="79/74/0e" # Green
color11="b5/76/14" # Yellow
color12="07/66/78" # Blue
color13="8f/3f/71" # Magenta
color14="42/7b/58" # Cyan
color15="28/28/28" # Bright White

# 256 color
color16="af/3a/03" # Orange
color17="d6/5d/0e" # OrangeRed
color18="eb/db/b2" # Black5%
color19="d5/c4/b2" # Black10%
color20="66/5c/a1" # White5%
color21="3c/38/36" # White10%

# Base
color_background="fb/f1/c7" # Black
color_foreground="50/49/45" # White

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() {
    printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' "$@"
  }
  put_template_var() {
    printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' "$@"
  }
  put_template_custom() {
    printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' "$@"
  }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() {
    printf '\033P\033]4;%d;rgb:%s\007\033\\' "$@"
  }
  put_template_var() {
    printf '\033P\033]%d;rgb:%s\007\033\\' "$@"
  }
  put_template_custom() {
    printf '\033P\033]%s%s\007\033\\' "$@"
  }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() {
    [ "$1" -lt 16 ] && printf "\e]P%x%s" "$1" "$(echo "$2" | sed 's/\///g')"
  }
  put_template_var() {
    true
  }
  put_template_custom() {
    true
  }
else
  put_template() {
    printf '\033]4;%d;rgb:%s\033\\' "$@"
  }
  put_template_var() {
    printf '\033]%d;rgb:%s\033\\' "$@"
  }
  put_template_custom() {
    printf '\033]%s%s\033\\' "$@"
  }
fi

# 16 color space
put_template 0 $color00
put_template 1 $color01
put_template 2 $color02
put_template 3 $color03
put_template 4 $color04
put_template 5 $color05
put_template 6 $color06
put_template 7 $color07
put_template 8 $color08
put_template 9 $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg 504945 # foreground
  put_template_custom Ph fbf1c7 # background
  put_template_custom Pi 282828     # bold color
  put_template_custom Pj fbf1c7 # selection color
  put_template_custom Pk b57614     # selected text color
  put_template_custom Pl 504945 # cursor
  put_template_custom Pm fbf1c7 # cursor text
else
  put_template_var 10 $color_foreground
  if [ "$WALH_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background

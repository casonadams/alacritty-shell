#!/usr/bin/env bash

# Normal
color00="2e/34/40" # Black
color01="bf/61/6a" # Red
color02="a3/be/8c" # Green
color03="eb/cb/8b" # Yellow
color04="8f/a1/b3" # Blue
color05="b4/8e/ad" # Magenta
color06="96/b5/b4" # Cyan
color07="e5/e9/f0" # White

# Bright
color08="4c/56/6a" # Bright Black
color09="bf/61/6a" # Red
color10="a3/be/8c" # Green
color11="eb/cb/8b" # Yellow
color12="8f/a1/b3" # Blue
color13="b4/8e/ad" # Magenta
color14="96/b5/b4" # Cyan
color15="8f/bc/bb" # Bright White

# 256 color
color16="d0/87/70" # Orange
color17="5e/81/ac" # OrangeRed
color18="3b/42/52" # Black5%
color19="43/4c/52" # Black10%
color20="d8/de/5e" # White5%
color21="ec/ef/f4" # White10%

# Base
color_background="2e/34/40" # Black
color_foreground="e5/e9/f0" # White

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
  put_template_custom Pg e5e9f0 # foreground
  put_template_custom Ph 2e3440 # background
  put_template_custom Pi 8fbcbb     # bold color
  put_template_custom Pj ebcb8b # selection color
  put_template_custom Pk 2e3440     # selected text color
  put_template_custom Pl e5e9f0 # cursor
  put_template_custom Pm 2e3440 # cursor text
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

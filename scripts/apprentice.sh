#!/usr/bin/env bash

# Normal
color00="26/26/26" # Black
color01="AF/5F/5F" # Red
color02="5F/87/5F" # Green
color03="87/87/5F" # Yellow
color04="5F/87/AF" # Blue
color05="5F/5F/87" # Magenta
color06="5F/87/87" # Cyan
color07="BC/BC/BC" # White

# Bright
color08="44/44/44" # Bright Black
color09="AF/5F/5F" # Red
color10="5F/87/5F" # Green
color11="87/87/5F" # Yellow
color12="5F/87/AF" # Blue
color13="5F/5F/87" # Magenta
color14="5F/87/87" # Cyan
color15="FF/FF/FF" # Bright White

# 256 color
color16="b0/87/5e" # Orange
color17="FF/FF/AF" # OrangeRed
color18="33/33/33" # Black5%
color19="87/87/33" # Black10%
color20="5F/AF/AF" # White5%
color21="eb/db/b2" # White10%

# Base
color_background="26/26/26" # Black
color_foreground="BC/BC/BC" # White

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
  put_template_custom Pg BCBCBC # foreground
  put_template_custom Ph 262626 # background
  put_template_custom Pi FFFFFF     # bold color
  put_template_custom Pj 87875F # selection color
  put_template_custom Pk 262626     # selected text color
  put_template_custom Pl BCBCBC # cursor
  put_template_custom Pm 262626 # cursor text
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

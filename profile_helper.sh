#!/usr/bin/env bash

_ALACRITTY_YML=${HOME}/.config/alacritty/alacritty.yml
echo "export _ALACRITTY_YML=${_ALACRITTY_YML}"

_K9S_YML=${HOME}/.config/k9s/skin.yml
echo "export _K9S_YML=${_K9S_YML}"

cat << 'FUNC'
_all() {
  local theme="$1"
  _alacritty "$theme"
  _k9s "$theme"
}
FUNC

cat << 'FUNC'
_alacritty() {
  local theme="$1"
  sed -i -e "s#^colors: \*.*#colors: *$theme#g" "${_ALACRITTY_YML}"
}
FUNC

cat << 'FUNC'
_k9s() {
  local theme="$1"
  local background foreground red green yellow blue magenta cyan brightblack orange black

  mkdir -p "${HOME}/.config/k9s"
  cp "${_ALACRITTY_SHELL}/skin.yml" "${HOME}/.config/k9s/skin.yml"

  sed -i 's/0x/#/g' "${_ALACRITTY_YML}"

  background=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.primary.background" "${_ALACRITTY_YML}")
  foreground=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.primary.foreground" "${_ALACRITTY_YML}")
  red=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.normal.red" "${_ALACRITTY_YML}")
  green=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.normal.green" "${_ALACRITTY_YML}")
  yellow=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.normal.yellow" "${_ALACRITTY_YML}")
  blue=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.normal.blue" "${_ALACRITTY_YML}")
  magenta=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.normal.magenta" "${_ALACRITTY_YML}")
  cyan=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.normal.cyan" "${_ALACRITTY_YML}")
  brightblack=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.bright.black" "${_ALACRITTY_YML}")
  orange=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.indexed_colors[0].color" "${_ALACRITTY_YML}")
  black=$("${_ALACRITTY_SHELL}/yq" e ".schemes.$theme.indexed_colors[2].color" "${_ALACRITTY_YML}")

  sed -i -e "s#^background: .*#background: \&background \"\\$background\"#g" "${_K9S_YML}"
  sed -i -e "s#^foreground: .*#foreground: \&foreground \"\\$foreground\"#g" "${_K9S_YML}"
  sed -i -e "s#^red: .*#red: \&red \"\\$red\"#g" "${_K9S_YML}"
  sed -i -e "s#^green: .*#green: \&green \"\\$green\"#g" "${_K9S_YML}"
  sed -i -e "s#^yellow: .*#yellow: \&yellow \"\\$yellow\"#g" "${_K9S_YML}"
  sed -i -e "s#^blue: .*#blue: \&blue \"\\$blue\"#g" "${_K9S_YML}"
  sed -i -e "s#^magenta: .*#magenta: \&magenta \"\\$magenta\"#g" "${_K9S_YML}"
  sed -i -e "s#^cyan: .*#cyan: \&cyan \"\\$cyan\"#g" "${_K9S_YML}"
  sed -i -e "s#^brightblack: .*#brightblack: \&brightblack \"\\$brightblack\"#g" "${_K9S_YML}"
  sed -i -e "s#^orange: .*#orange: \&orange \"\\$orange\"#g" "${_K9S_YML}"
  sed -i -e "s#^black: .*#black: \&black \"\\$black\"#g" "${_K9S_YML}"
}
FUNC

for theme in $("${_ALACRITTY_SHELL}/yq" e '.schemes.[] | anchor' "${_ALACRITTY_YML}"); do
  alacritty_func_name="alacritty_${theme}"
  echo "alias $alacritty_func_name=\"_alacritty $theme\""

  k9s_func_name="k9s_${theme}"
  echo "alias $k9s_func_name=\"_k9s $theme\""

  all_func_name="all_${theme}"
  echo "alias $all_func_name=\"_all $theme\""
done

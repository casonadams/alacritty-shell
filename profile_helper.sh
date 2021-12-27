#!/usr/bin/env bash

_ALACRITTY_YML=${HOME}/.config/alacritty/alacritty.yml
echo "export _ALACRITTY_YML=${_ALACRITTY_YML}"

cat << 'FUNC'
_alacritty()
{
  local theme="$1"
  sed -i -e "s#^colors: \*.*#colors: *$theme#g" "${_ALACRITTY_YML}"
}
FUNC

for theme in $("${_ALACRITTY_SHELL}/yq" e '.schemes.[] | anchor' "${_ALACRITTY_YML}"); do
  func_name="alacritty_${theme}"
  echo "alias $func_name=\"_alacritty $theme\""
done

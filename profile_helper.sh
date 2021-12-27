#!/usr/bin/env bash

ALACRITTY_YML=${HOME}/.config/alacritty/alacritty.yml
echo "export ALACRITTY_YML=${ALACRITTY_YML}"

cat << 'FUNC'
_alacritty()
{
  local theme="$1"

  sed -i "" -e "s#^colors: \*.*#colors: *$theme#g" "${ALACRITTY_YML}"
}
FUNC

for theme in $(yq e '.schemes.[] | anchor' "${ALACRITTY_YML}"); do
  func_name="alacritty_${theme}"
  echo "alias $func_name=\"_alacritty $theme\""
done

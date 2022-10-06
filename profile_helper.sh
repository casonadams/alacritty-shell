#!/usr/bin/env bash

_ALACRITTY_YML="${HOME}/.config/alacritty/alacritty.yml"
echo "export _ALACRITTY_YML=${_ALACRITTY_YML}"

cat << 'FUNC'
_add() {
  local theme="$1"

  yq -i eval-all '. as $item ireduce ({}; . * $item )' "${_ALACRITTY_YML}" "${_ALACRITTY_SHELL}/themes/${theme}.yml"
  _alacritty "${theme}"
}

FUNC
cat << 'FUNC'
_alacritty() {
  local theme="$1"

  sed -i'' -e "s/^colors: \*.*/colors: *$theme/g" "${_ALACRITTY_YML}"
}
FUNC

themes=$(sed -n 's/^\(.*\): &.*/\1/p' "${_ALACRITTY_YML}" | sed -r 's/ //g')

for theme in $themes; do
  alacritty_func_name="alacritty_${theme}"
  echo "alias $alacritty_func_name=\"_alacritty $theme\""
done

for theme in "${_ALACRITTY_SHELL}"/themes/*.yml; do
  filename=$(basename -s .yml "${theme}")
  alacritty_func_name="add_alacritty_${filename}"
  echo "alias $alacritty_func_name=\"_add ${filename}\""
done

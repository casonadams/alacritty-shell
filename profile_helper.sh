#!/usr/bin/env bash

_ALACRITTY_YML="${HOME}/.config/alacritty/alacritty.yml"
echo "export _ALACRITTY_YML=${_ALACRITTY_YML}"

_YQ_PATH="${_ALACRITTY_SHELL}/yq"
yq_in_path="$(command -v yq)"
if [ -x "${yq_in_path}" ]; then
  _YQ_PATH="$(which yq)"
fi

echo "export _YQ_PATH=${_YQ_PATH}"

cat << 'FUNC'
_add() {
  local theme="$1"

  "${_YQ_PATH}" -i eval-all '. as $item ireduce ({}; . * $item )' "${_ALACRITTY_YML}" "${_ALACRITTY_SHELL}/themes/${theme}.yml"
  _alacritty "${theme}"
}

FUNC
cat << 'FUNC'
_alacritty() {
  local theme="$1"

  "${_YQ_PATH}" -i eval-all ".colors alias = \"${theme}\"" "${_ALACRITTY_YML}"
}
FUNC

for theme in $("${_YQ_PATH}" e '.schemes.[] | anchor' "${_ALACRITTY_YML}"); do
  alacritty_func_name="alacritty_${theme}"
  echo "alias $alacritty_func_name=\"_alacritty $theme\""
done

for theme in "${_ALACRITTY_SHELL}"/themes/*.yml; do
  filename=$(basename -s .yml "${theme}")
  alacritty_func_name="add_alacritty_${filename}"
  echo "alias $alacritty_func_name=\"_add ${filename}\""
done

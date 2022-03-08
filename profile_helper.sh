#!/usr/bin/env bash

os="$(uname -s)"

_ALACRITTY_YML="${HOME}/.config/alacritty/alacritty.yml"
echo "export _ALACRITTY_YML=${_ALACRITTY_YML}"

if [ -n "${XDG_CONFIG_HOME+x}" ]; then
  _K9s_CONFIG="${XDG_CONFIG_HOME}/k9s"
elif [ "${os}" == "Darwin" ]; then
  _K9s_CONFIG="${HOME}/Library/Application\ Support/k9s"
else
  _K9s_CONFIG="${HOME}/.config/k9s"
fi

echo "export _K9s_CONFIG=${_K9s_CONFIG}"

cat << 'FUNC'
_all() {
  local theme="$1"
  _alacritty "$theme"
  _k9s "$theme"
}
FUNC

cat << 'FUNC'
_alacritty() {
  local theme="$1" yq
  yq="${_ALACRITTY_SHELL}/yq"

  "$yq" -i eval-all ".colors alias = \"${theme}\"" "${_ALACRITTY_YML}"
}
FUNC

cat << 'FUNC'
_k9s() {
  local theme="$1"
  local yq background foreground red green yellow blue magenta cyan brightblack brightwhite orange black

  mkdir -p "${_K9s_CONFIG}"
  cp "${_ALACRITTY_SHELL}/skin.yml" "${_K9s_CONFIG}/"

  yq="${_ALACRITTY_SHELL}/yq"

  "$yq" -i eval-all "select(fileIndex==0).background  = select(fileIndex==1).schemes.$theme.primary.background      | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).foreground  = select(fileIndex==1).schemes.$theme.primary.foreground      | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).red         = select(fileIndex==1).schemes.$theme.normal.red              | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).green       = select(fileIndex==1).schemes.$theme.normal.green            | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).yellow      = select(fileIndex==1).schemes.$theme.normal.yellow           | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).blue        = select(fileIndex==1).schemes.$theme.normal.blue             | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).magenta     = select(fileIndex==1).schemes.$theme.normal.magenta          | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).cyan        = select(fileIndex==1).schemes.$theme.normal.cyan             | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).brightblack = select(fileIndex==1).schemes.$theme.bright.black            | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).brightwhite = select(fileIndex==1).schemes.$theme.bright.white            | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).orange      = select(fileIndex==1).schemes.$theme.indexed_colors[0].color | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"
  "$yq" -i eval-all "select(fileIndex==0).black       = select(fileIndex==1).schemes.$theme.indexed_colors[2].color | select(fileIndex==0)" "${_K9s_CONFIG}/skin.yml" "${_ALACRITTY_YML}"

  sed -i'' -e 's/0x/#/g' "${_K9s_CONFIG}/skin.yml"
  sed -i'' -e 's/null/default/g' "${_K9s_CONFIG}/skin.yml"
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

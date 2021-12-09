#!/usr/bin/env bash

if [ -s "$BASH" ]; then
    file_name=${BASH_SOURCE[0]}
elif [ -s "$ZSH_NAME" ]; then
    file_name=${(%):-%x}
fi
script_dir=$(cd "$(dirname "$file_name")" && pwd)

. "$script_dir/realpath/realpath.sh"

if [ -f ~/.walh_theme ]; then
  script_name=$(basename "$(realpath ~/.walh_theme)" .sh)
  echo "export WALH_THEME=${script_name#*-}"
  echo ". ~/.walh_theme"
fi
cat <<'FUNC'
_walh()
{
  local script=$1
  local theme=$2
  [ -f $script ] && . $script
  ln -fs $script ~/.walh_theme
  export WALH_THEME=${theme}
  echo -e "if \0041exists('g:colors_name') || g:colors_name != 'walh-$theme'\n  colorscheme walh-$theme\nendif" >| ~/.vimrc_background
  if [ -n ${WALH_SHELL_HOOKS:+s} ] && [ -d "${WALH_SHELL_HOOKS}" ]; then
    for hook in $WALH_SHELL_HOOKS/*; do
      [ -f "$hook" ] && [ -x "$hook" ] && "$hook"
    done
  fi
}
FUNC
for script in "$script_dir"/scripts/*.sh; do
  script_name=${script##*/}
  script_name=${script_name%.sh}
  theme=${script_name}
  func_name="walh_${theme}"
  echo "alias $func_name=\"_walh \\\"$script\\\" $theme\""
done;


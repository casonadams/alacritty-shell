#!/usr/bin/env zsh

export _ALACRITTY_SHELL=$(dirname "${(%):-%x}")

YQ_VERSION="v4.16.2"
YQ_URL="https://github.com/mikefarah/yq/releases/download"

if [ ! -f "${_ALACRITTY_SHELL}/yq" ]; then
  local uname="$(uname)"
  local arch="$(uname -m)"

  if [[ $arch == "x86_64" ]]; then
    curl -sSL "${YQ_URL}/${YQ_VERSION}/yq_${uname}_amd64" -o "${_ALACRITTY_SHELL}/yq"
    chmod +x "${_ALACRITTY_SHELL}/yq"
  else
    echo "$arch not supported"
  fi
fi

[ -n "$PS1" ] \
  && [ -s "${_ALACRITTY_SHELL}/profile_helper.sh" ] \
  && eval "$("${_ALACRITTY_SHELL}/profile_helper.sh")"


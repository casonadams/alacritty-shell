# alacritty-shell

zsh alacritty-shell plugin

alacritty-shell is a dynamic theme chooser based on the `alacritty.yml`
`schemes:` setttings

## requirements

### yq

`yq` is used to update the alacritty.yml file

[install](https://github.com/mikefarah/yq#install)

### custom alacritty themes

[Alacritty color-schemes](https://github.com/alacritty/alacritty/wiki/Color-schemes)
describes how to use multiple schemes.

[alacritty-shell themes wiki](https://github.com/casonadams/alacritty-shell/wiki/Themes)

 **Note** add `index: 208` = `orange`

## setup

### zinit

```zsh
zinit wait lucid for \
  casonadams/alacritty-shell \
  ;
```

### oh-my-zsh

```sh
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/" git clone --depth=1 "https://github.com/casonadams/alacritty-shell.git" "${ZSH_CUSTOM}/plugins/alacritty-shell"
```

```zsh
# ~/.zshrc

plugins+=(
  alacritty-shell
)
```

### manual

Add following lines to `.bashrc` or `.zshrc`:

```sh
if [ ! -d "${HOME}/.alacritty-shell" ]; then
  git clone https://github.com/casonadams/alacritty-shell.git "${HOME}/.alacritty-shell"
fi

ALACRITTY_SHELL="${HOME}/.alacritty-shell"
[ -n "$PS1" ] \
  && [ -s "${ALACRITTY_SHELL}/profile_helper.sh" ] \
  && eval "$("${ALACRITTY_SHELL}/profile_helper.sh")"
```

**NOTE** restart shell

## usage

### add a builtin theme (tab complete)

```sh
add_alacritty_darcula-dark
```

### change terminal colors (tab complete)

```sh
alacritty_darcula-dark
```

### using with vim

install [walh](https://github.com/casonadams/walh) colorscheme

```vimrc
set notermguicolors
colorscheme walh-gruvbox
```

**Note** not tested on windows (probably won't work) open to MRs to support it
though

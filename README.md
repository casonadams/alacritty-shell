# alacritty-shell

zsh alacritty-shell plugin

alacritty-shell is a dynamic theme chooser based on the `alacritty.yml`
`schemes:` setttings

Themes need to be defined for this plugin to work correctly see:
[Alacritty themes wiki](https://github.com/casonadams/alacritty-shell/wiki/Themes)

## setup alacritty themes

[Alacritty color-schemes](https://github.com/alacritty/alacritty/wiki/Color-schemes)
describes how to use multiple schemes.

[Alacritty themes wiki](https://github.com/casonadams/alacritty-shell/wiki/Themes)

 **Note** add `index: 208` = `orange`

## install

### zinit

```zsh
zinit wait lucid for \
  casonadams/alacritty-shell \
  ;
```

### oh-my-zsh

#### download repo to zsh custom plugins

```sh
ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/" git clone --depth=1 "https://github.com/casonadams/alacritty-shell.git" "${ZSH_CUSTOM}/plugins/alacritty-shell"
```

#### add plugin to `~/.zshrc`

```zsh
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

## change terminal colors

**NOTE** restart shell

```sh
alacritty_theme_name
```

## using with vim

install [walh](https://github.com/casonadams/walh) colorscheme

```vimrc
set notermguicolors
colorscheme walh-gruvbox
```

**Note** not tested on windows (probably won't work) open to MRs to support it
though

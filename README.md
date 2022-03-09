# alacritty-shell

zsh alacritty-shell plugin

## example install with zinit

```zsh
zinit wait lucid for \
  OMZL::key-bindings.zsh \
  OMZL::history.zsh \
  OMZP::git \
  casonadams/alacritty-shell \
  casonadams/skim.zsh \
  ;
```

**NOTE** recommended to install `yq` manually see manual install / `yq`
section for more information.  Other wise an attempt will be made to
auto install the `yq` binary.  Not supported for all platforms

## manual install

### yq

[yq](https://github.com/mikefarah/yq/releases) is used to parse the
alacritty.yml file and needs to be installed in the $PATH.

### bash/zsh

Add following lines to ~/.bashrc or ~/.zshrc:

```sh
if [ ! -d "${HOME}/.config/alacritty-shell" ]; then
  git clone https://github.com/casonadams/alacritty-shell.git ~/.config/alacritty-shell
fi

ALACRITTY_SHELL="${HOME}/.config/alacritty-shell"
[ -n "$PS1" ] \
  && [ -s "${ALACRITTY_SHELL}/profile_helper.sh" ] \
  && eval "$("${ALACRITTY_SHELL}/profile_helper.sh")"
```

restart shell

## setup alacritty themes

[Alacritty color-schemes](https://github.com/alacritty/alacritty/wiki/Color-schemes)
desribes how to use multiple schemes.

[Alacritty themes wiki](https://github.com/casonadams/alacritty-shell/wiki/Themes)

[other examples](https://github.com/aarowill/base16-alacritty/tree/master/colors)

- **Note** use the `256` themes
- add `index: 208` = `orange`
- add `index: 247` = `highlight` dark is +5 lightness, and light is -5 lightness to the background color

## change terminal colors

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

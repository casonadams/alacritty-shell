# alacritty-shell

zsh alacritty-shell plugin

## example install with zinit

```zsh
zinit wait lucid for \
  OMZL::key-bindings.zsh \
  OMZL::history.zsh \
  OMZP::git \
  casonadams/alacritty-shell \
  ;
```

## manual install

```sh
git clone https://github.com/casonadams/alacritty-shell.git ~/.config/alacritty-shell
```

### bash/zsh

Add following lines to ~/.bashrc or ~/.zshrc:

```sh
ALACRITTY_SHELL="$HOME/.config/alacritty-shell/"
[ -n "$PS1" ] && \
    [ -s "$ALACRITTY_SHELL/profile_helper.sh" ] && \
        eval "$("$ALACRITTY/profile_helper.sh")"
```

restart shell

## setup alacritty themes

```yml
schemes:
  solarized_light: &solarized_light
    primary:
      #...
    normal:
      #...
    bright:
      #...
  solarized_dark: &solarized_dark
    primary:
      #...
    normal:
      #...
    bright:
      #...

colors: *solarized_light
```

[examples](https://github.com/aarowill/base16-alacritty/tree/master/colors)
- **Note** use the `256` themes

## change terminal colors

```sh
alacritty_theme_name
```

## using with vim

install [walh](https://github.com/casonadams/walh) colorscheme

```vimrc
set notermguicolors
colorscheme walh-eighties
```

**Note** not tested on windows (probably won't work) open to MRs to support it though

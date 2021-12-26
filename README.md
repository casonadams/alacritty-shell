# walh-shell

zsh walh-shell plugin

## example install with zinit

```zsh
zinit wait lucid for \
  OMZL::key-bindings.zsh \
  OMZL::history.zsh \
  OMZP::git \
  casonadams/walh-shell.zsh \
  ;
```

## manual install

```sh
git clone https://github.com/casonadams/walh-shell.zsh.git ~/.config/walh-shell.zsh
```

### bash/zsh

Add following lines to ~/.bashrc or ~/.zshrc:

```sh
WALH_SHELL="$HOME/.config/walh-shell/"
[ -n "$PS1" ] && \
    [ -s "$WALH_SHELL/profile_helper.sh" ] && \
        eval "$("$WALH_SHELL/profile_helper.sh")"
```

restart shell

## change terminal colors

```sh
# onedark theme
walh_onedark
```

```sh
# onelight theme
walh_onelight
```

## using with vim

install [walh](https://github.com/casonadams/walh) colorscheme

```vimrc
set notermguicolors
colorscheme walh-eighties
```

# base16-shell

zsh base16-shell plugin

installs and setups up [base16-shell](https://github.com/chriskempson/base16-shell)

## example install with zinit

```zsh
zinit wait lucid for \
  OMZL::key-bindings.zsh \
  OMZL::history.zsh \
  OMZP::git \
  casonadams/base16-shell.zsh \
  ;
```

## change terminal colors

```sh
# gruvbox dark theme
base16_gruvbox-dark-medium
```

```sh
# gruvbox dark light
base16_gruvbox-light-medium
```

## using with vim

install [walh](https://github.com/casonadams/walh) colorscheme

```vimrc
set notermguicolors
colorscheme walh-eighties
```

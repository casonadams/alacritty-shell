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

[Alacritty color-schemes](https://github.com/alacritty/alacritty/wiki/Color-schemes)
desribes how to use multiple schemes.

<details>
<summary>twilight</summary>
<p>

```yml
schemes:
  twilight: &twilight
    primary:
      background: "#141414"
      foreground: "#e0e0e0"
    bright:
      black: "#262626"
      blue: "#44474a"
      cyan: "#778385"
      green: "#afb97a"
      magenta: "#b4be7c"
      red: "#c06d44"
      yellow: "#c2a86c"
      white: "#ffffd4"
    normal:
      black: "#141414"
      blue: "#44474a"
      cyan: "#778385"
      green: "#afb97a"
      magenta: "#b4be7c"
      red: "#c06d44"
      yellow: "#c2a86c"
      white: "#e0e0e0"
    indexed_colors:
      - { index: 208, color: "0xcc9966" }
      - { index: 247, color: "0x212121" }
colors: *twilight
```

</p>
</details>

<details>
<summary>tokyo-night-storm</summary>
<p>

```yml
schemes:
  tokyo-night-storm: &tokyo-night-storm
    primary:
      background: "0x24283b"
      foreground: "0xa9b1d6"
    normal:
      black: "0x32344a"
      red: "0xf7768e"
      green: "0x9ece6a"
      yellow: "0xe0af68"
      blue: "0x7aa2f7"
      magenta: "0xad8ee6"
      cyan: "0x449dab"
      white: "0x9699a8"
    bright:
      black: "0x444b6a"
      red: "0xf7768e"
      green: "0x9ece6a"
      yellow: "0xe0af68"
      blue: "0x7aa2f7"
      magenta: "0xad8ee6"
      cyan: "0x449dab"
      white: "0xacb0d0"
    indexed_colors:
      - { index: 208, color: "0xFF9E64" }
      - { index: 247, color: "0x282d42" }
colors: *tokyo-night-storm
```

</p>
</details>

<details>
<summary>tokyo-night</summary>
<p>

```yml
schemes:
  tokyo-night: &tokyo-night
    primary:
      background: "0x1a1b26"
      foreground: "0xa9b1d6"
    normal:
      black: "0x32344a"
      red: "0xf7768e"
      green: "0x9ece6a"
      yellow: "0xe0af68"
      blue: "0x7aa2f7"
      magenta: "0xad8ee6"
      cyan: "0x449dab"
      white: "0x787c99"
    bright:
      black: "0x444b6a"
      red: "0xf7768e"
      green: "0x9ece6a"
      yellow: "0xe0af68"
      blue: "0x7aa2f7"
      magenta: "0xad8ee6"
      cyan: "0x449dab"
      white: "0xacb0d0"
    indexed_colors:
      - { index: 208, color: "0xFF9E64" }
      - { index: 247, color: "0x232433" }
colors: *tokyo-night
```

</p>
</details>

<details>
<summary>code-dark</summary>
<p>

```yml
schemes:
  code-dark: &code-dark
    primary:
      background: "#1e1e1e"
      foreground: "#c6c6c6"
    normal:
      black: "#383838"
      red: "#df1426"
      green: "#00c073"
      yellow: "#e4e700"
      blue: "#0072cf"
      magenta: "#cc2bc2"
      cyan: "#00aad1"
      white: "#e5e5e5"
    bright:
      black: "#666666"
      red: "#df1426"
      green: "#00c073"
      yellow: "#e4e700"
      blue: "#0072cf"
      magenta: "#cc2bc2"
      cyan: "#00aad1"
      white: "#e0e0e0"
    indexed_colors:
      - { index: 208, color: "0xDF6526" }
      - { index: 247, color: "0x2b2b2b" }
colors: *code-dark
```

</p>
</details>

<details>
<summary>ocean-next</summary>
<p>

```yml
schemes:
  ocean-next: &ocean-next
    primary:
      background: "0x1b2b34"
      foreground: "0xc0c5ce"
    cursor:
      text: "0x1b2b34"
      cursor: "0xc0c5ce"
    normal:
      black: "0x1b2b34"
      red: "0xec5f67"
      green: "0x99c794"
      yellow: "0xfac863"
      blue: "0x6699cc"
      magenta: "0xc594c5"
      cyan: "0x5fb3b3"
      white: "0xc0c5ce"
    bright:
      black: "0x65737e"
      red: "0xec5f67"
      green: "0x99c794"
      yellow: "0xfac863"
      blue: "0x6699cc"
      magenta: "0xc594c5"
      cyan: "0x5fb3b3"
      white: "0xd8dee9"
    indexed_colors:
      - { index: 208, color: "0xf99157" }
      - { index: 247, color: "0x343d46" }
colors: *ocean-next
```

</p>
</details>

<details>
<summary>ocean</summary>
<p>

```yml
schemes:
  ocean: &ocean
    primary:
      background: "0x2b303b"
      foreground: "0xc0c5ce"
    cursor:
      text: "0x2b303b"
      cursor: "0xc0c5ce"
    normal:
      black: "0x2b303b"
      red: "0xbf616a"
      green: "0xa3be8c"
      yellow: "0xebcb8b"
      blue: "0x8fa1b3"
      magenta: "0xb48ead"
      cyan: "0x96b5b4"
      white: "0xc0c5ce"
    bright:
      black: "0x65737e"
      red: "0xbf616a"
      green: "0xa3be8c"
      yellow: "0xebcb8b"
      blue: "0x8fa1b3"
      magenta: "0xb48ead"
      cyan: "0x96b5b4"
      white: "0xeff1f5"
    indexed_colors:
      - { index: 208, color: "0xd08770" }
      - { index: 247, color: "0x343d46" }
colors: *ocean
```

</p>
</details>

<details>
<summary>axual-dark</summary>
<p>

```yml
schemes:
  axual-dark: &axual-dark
    primary:
      background: "0x113851"
      foreground: "0xd8d7cd"
    cursor:
      text: "0x113851"
      cursor: "0xd8d7cd"
    normal:
      black: "0x113851"
      red: "0xD7595F"
      green: "0xb5bd68"
      yellow: "0xF2BF40"
      blue: "0x81a2be"
      magenta: "0xb294bb"
      cyan: "0x47B0AB"
      white: "0xd8d7cd"
    bright:
      black: "0xA99688"
      red: "0xD7595F"
      green: "0xb5bd68"
      yellow: "0xF2BF40"
      blue: "0x81a2be"
      magenta: "0xb294bb"
      cyan: "0x47B0AB"
      white: "0xfffdf1"
    indexed_colors:
      - { index: 208, color: "0xe58c4f" }
      - { index: 247, color: "0x13415e" }
colors: *axual-dark
```

</p>
</details>

<details>
<summary>tommorrow-dark</summary>
<p>

```yml
schemes:
  tomorrow-dark: &tomorrow-dark
    primary:
      background: "0x1d1f21"
      foreground: "0xc5c8c6"
    cursor:
      text: "0x1d1f21"
      cursor: "0xc5c8c6"
    normal:
      black: "0x1d1f21"
      red: "0xcc6666"
      green: "0xb5bd68"
      yellow: "0xf0c674"
      blue: "0x81a2be"
      magenta: "0xb294bb"
      cyan: "0x8abeb7"
      white: "0xc5c8c6"
    bright:
      black: "0x969896"
      red: "0xcc6666"
      green: "0xb5bd68"
      yellow: "0xf0c674"
      blue: "0x81a2be"
      magenta: "0xb294bb"
      cyan: "0x8abeb7"
      white: "0xffffff"
    indexed_colors:
      - { index: 208, color: "0xde935f" }
      - { index: 247, color: "0x282a2e" }
colors: *tomorrow-dark
```

</p>
</details>

<details>
<summary>tommorrow</summary>
<p>

```yml
schemes:
  tomorrow: &tomorrow
    primary:
      background: "0xffffff"
      foreground: "0x4d4d4c"
    cursor:
      text: "0xffffff"
      cursor: "0x4d4d4c"
    normal:
      black: "0xffffff"
      red: "0xc82829"
      green: "0x718c00"
      yellow: "0xeab700"
      blue: "0x4271ae"
      magenta: "0x8959a8"
      cyan: "0x3e999f"
      white: "0x4d4d4c"
    bright:
      black: "0x8e908c"
      red: "0xc82829"
      green: "0x718c00"
      yellow: "0xeab700"
      blue: "0x4271ae"
      magenta: "0x8959a8"
      cyan: "0x3e999f"
      white: "0x1d1f21"
    indexed_colors:
      - { index: 208, color: "0xf5871f" }
      - { index: 247, color: "0xf2f2f2" }
colors: *tomorrow
```

</p>
</details>

<details>
<summary>gruvbox-dark</summary>
<p>

```yml
schemes:
  gruvbox-dark: &gruvbox-dark
    primary:
      background: "0x282828"
      foreground: "0xd5c4a1"
    cursor:
      text: "0x282828"
      cursor: "0xd5c4a1"
    normal:
      black: "0x282828"
      red: "0xfb4934"
      green: "0xb8bb26"
      yellow: "0xfabd2f"
      blue: "0x83a598"
      magenta: "0xd3869b"
      cyan: "0x8ec07c"
      white: "0xd5c4a1"
    bright:
      black: "0x665c54"
      red: "0xfb4934"
      green: "0xb8bb26"
      yellow: "0xfabd2f"
      blue: "0x83a598"
      magenta: "0xd3869b"
      cyan: "0x8ec07c"
      white: "0xfbf1c7"
    indexed_colors:
      - { index: 208, color: "0xfe8019" }
      - { index: 247, color: "0x3c3836" }
colors: *gruvbox-dark
```

</p>
</details>

<details>
<summary>nord</summary>
<p>

```yml
schemes:
  nord: &nord
    primary:
      background: "0x2e3440"
      foreground: "0xe5e9f0"
    cursor:
      text: "0x2e3440"
      cursor: "0xe5e9f0"
    normal:
      black: "0x2e3440"
      red: "0xbf616a"
      green: "0xa3be8c"
      yellow: "0xebcb8b"
      blue: "0x81a1c1"
      magenta: "0xb48ead"
      cyan: "0x88c0d0"
      white: "0xe5e9f0"
    bright:
      black: "0x4c566a"
      red: "0xbf616a"
      green: "0xa3be8c"
      yellow: "0xebcb8b"
      blue: "0x81a1c1"
      magenta: "0xb48ead"
      cyan: "0x88c0d0"
      white: "0x8fbcbb"
    indexed_colors:
      - { index: 208, color: "0xd08770" }
      - { index: 247, color: "0x3b4252" }
colors: *nord
```

</p>
</details>

<details>
<summary>one-dark</summary>
<p>

```yml
schemes:
  one-dark: &one-dark
    primary:
      background: "0x282c34"
      foreground: "0xabb2bf"
    cursor:
      text: "0x282c34"
      cursor: "0xabb2bf"
    normal:
      black: "0x282c34"
      red: "0xe06c75"
      green: "0x98c379"
      yellow: "0xe5c07b"
      blue: "0x61afef"
      magenta: "0xc678dd"
      cyan: "0x56b6c2"
      white: "0xabb2bf"
    bright:
      black: "0x545862"
      red: "0xe06c75"
      green: "0x98c379"
      yellow: "0xe5c07b"
      blue: "0x61afef"
      magenta: "0xc678dd"
      cyan: "0x56b6c2"
      white: "0xc8ccd4"
    indexed_colors:
      - { index: 208, color: "0xd19a66" }
      - { index: 247, color: "0x353b45" }
colors: *one-dark
```

</p>
</details>

<details>
<summary>one-light</summary>
<p>

```yml
schemes:
  one-light: &one-light
    primary:
      background: "0xfafafa"
      foreground: "0x383a42"
    cursor:
      text: "0xfafafa"
      cursor: "0x383a42"
    normal:
      black: "0xfafafa"
      red: "0xca1243"
      green: "0x50a14f"
      yellow: "0xc18401"
      blue: "0x4078f2"
      magenta: "0xa626a4"
      cyan: "0x0184bc"
      white: "0x383a42"
    bright:
      black: "0xa0a1a7"
      red: "0xca1243"
      green: "0x50a14f"
      yellow: "0xc18401"
      blue: "0x4078f2"
      magenta: "0xa626a4"
      cyan: "0x0184bc"
      white: "0x090a0b"
    indexed_colors:
      - { index: 208, color: "0xd75f00" }
      - { index: 247, color: "0xf0f0f1" }
colors: *one-light
```

</p>
</details>

[examples](https://github.com/aarowill/base16-alacritty/tree/master/colors)

- **Note** use the `256` themes
- add `index: 208` = `orange`
- add `index: 247` = StatusLine `black`

## change terminal colors

```sh
alacritty_theme_name
```

## change k9s colors

```sh
k9s_theme_name
```

## change all apps colors

- alacritty
- k9s

```sh
all_theme_name
```

## using with vim

install [walh](https://github.com/casonadams/walh) colorscheme

```vimrc
set notermguicolors
colorscheme walh-gruvbox
```

**Note** not tested on windows (probably won't work) open to MRs to support it
though

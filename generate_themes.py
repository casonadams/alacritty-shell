#!/usr/bin/env python

import chevron
import os
import subprocess
import toml

for dir in os.listdir("themes"):
    theme_name = dir.split(".")[0]

    with open(f"themes/{dir}", "r") as f:
        theme = toml.load(f)

    background = theme["background"]
    foreground = theme["foreground"]

    color00 = theme["color00"]
    color01 = theme["color01"]
    color02 = theme["color02"]
    color03 = theme["color03"]
    color04 = theme["color04"]
    color05 = theme["color05"]
    color06 = theme["color06"]
    color07 = theme["color07"]
    color08 = theme["color08"]

    color15 = theme["color15"]
    color16 = theme["color16"]
    color17 = theme["color17"]
    color18 = theme["color18"]
    color19 = theme["color19"]
    color20 = theme["color20"]
    color21 = theme["color21"]

    with open("template/default.mustache", "r") as file:
        f = file.read()
        args = {
            "template": f,
            "data": {
                "foreground-hex": foreground[1:7],
                "foreground-hex-r": foreground[1:3],
                "foreground-hex-g": foreground[3:5],
                "foreground-hex-b": foreground[5:7],
                "background-hex": background[1:7],
                "background-hex-r": background[1:3],
                "background-hex-g": background[3:5],
                "background-hex-b": background[5:7],
                "base00-hex": color00[1:7],
                "base00-hex-r": color00[1:3],
                "base00-hex-g": color00[3:5],
                "base00-hex-b": color00[5:7],
                "base01-hex": color01[1:7],
                "base01-hex-r": color01[1:3],
                "base01-hex-g": color01[3:5],
                "base01-hex-b": color01[5:7],
                "base02-hex": color02[1:7],
                "base02-hex-r": color02[1:3],
                "base02-hex-g": color02[3:5],
                "base02-hex-b": color02[5:7],
                "base03-hex": color03[1:7],
                "base03-hex-r": color03[1:3],
                "base03-hex-g": color03[3:5],
                "base03-hex-b": color03[5:7],
                "base04-hex": color04[1:7],
                "base04-hex-r": color04[1:3],
                "base04-hex-g": color04[3:5],
                "base04-hex-b": color04[5:7],
                "base05-hex": color05[1:7],
                "base05-hex-r": color05[1:3],
                "base05-hex-g": color05[3:5],
                "base05-hex-b": color05[5:7],
                "base06-hex": color06[1:7],
                "base06-hex-r": color06[1:3],
                "base06-hex-g": color06[3:5],
                "base06-hex-b": color06[5:7],
                "base07-hex": color07[1:7],
                "base07-hex-r": color07[1:3],
                "base07-hex-g": color07[3:5],
                "base07-hex-b": color07[5:7],
                "base08-hex": color08[1:7],
                "base08-hex-r": color08[1:3],
                "base08-hex-g": color08[3:5],
                "base08-hex-b": color08[5:7],
                "base15-hex": color15[1:7],
                "base15-hex-r": color15[1:3],
                "base15-hex-g": color15[3:5],
                "base15-hex-b": color15[5:7],
                "base16-hex": color16[1:7],
                "base16-hex-r": color16[1:3],
                "base16-hex-g": color16[3:5],
                "base16-hex-b": color16[5:7],
                "base17-hex": color17[1:7],
                "base17-hex-r": color17[1:3],
                "base17-hex-g": color17[3:5],
                "base17-hex-b": color17[5:7],
                "base18-hex": color18[1:7],
                "base18-hex-r": color18[1:3],
                "base18-hex-g": color18[3:5],
                "base18-hex-b": color18[5:7],
                "base19-hex": color19[1:7],
                "base19-hex-r": color19[1:3],
                "base19-hex-g": color19[3:5],
                "base19-hex-b": color19[5:7],
                "base20-hex": color20[1:7],
                "base20-hex-r": color20[1:3],
                "base20-hex-g": color20[3:5],
                "base20-hex-b": color20[5:7],
                "base21-hex": color21[1:7],
                "base21-hex-r": color21[1:3],
                "base21-hex-g": color21[3:5],
                "base21-hex-b": color21[5:7],
            },
        }
        render = chevron.render(**args)

    script_file = f"scripts/walh_{theme_name}.sh"
    with open(script_file, "w") as f:
        for r in iter(render.splitlines()):
            f.write(f"{r}\n")

    subprocess.run(["chmod", "+x", script_file])

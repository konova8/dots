#!/bin/sh
draw() {
  kitten icat --stdin no --transfer-mode memory --place "${w}x${h}@${x}x${y}" "$1" </dev/null >/dev/tty
  exit 1
}

file="$1"
w="$2"
h="$3"
x="$4"
y="$5"

case "$(file -Lb --mime-type "$file")" in 
    image/*)
        draw "$file"
        ;;
    video/*)
        # vidthumb is from here:
        # https://raw.githubusercontent.com/duganchen/kitty-pistol-previewer/main/vidthumb
        draw "$("$HOME"/.config/lf/vidthumb.sh "$file")"
        ;;
    *.tar*) tar tf "$file";;
    *.zip) unzip -l "$file";;
    *.rar) unrar l "$file";;
    *.7z) 7z l "$file";;
    *.pdf) pdftotext "$file" -;;
    *) highlight -O ansi --force "$file";;
esac

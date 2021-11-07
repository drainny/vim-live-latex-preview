#!/bin/bash
texfile="$2"
pdffile="$1"
zathura "$pdffile" &>/dev/null &
mupid="$!"
muwinid="0"
nummps=$(xdotool search --class "zathura" getwindowname %@ | grep -n "$pdffile" | cut -d":" -f1)
while [ -z $nummps ] ; do
    sleep 0.1
    nummps=$(xdotool search --class "zathura" getwindowname %@ | grep -n "$pdffile" | cut -d":" -f1)
done
echo -n "$(xdotool search --class "zathura" | sed -n "$nummps p")"
# try to return focus to GVIM
xdotool search --class --name "latex" windowactivate &>/dev/null
exit 0

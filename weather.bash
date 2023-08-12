# Get weather information
function weather() {
    [ -z "$1" ] && echo "Error: No location information was provided" && return 1
    URL="https://wttr.in/$@"
    OUT=".weather.out"

    if [ "$(command -v wget)" ]; then
	wget -q "$URL" -O "$OUT"
	sed "s/Follow.*//g" -i "$OUT" && (cat "$OUT" | head -c -2 | less)
	rm "$OUT"
    elif [ "$(command -v curl)" ]; then
	curl -s "$URL" | sed "s/Follow.*//g" | head -c -2 | less
    else
	echo "Error: Either wget or curl needs to be installed"
    fi
}

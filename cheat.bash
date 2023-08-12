# Query cheatsheet directly from cheat.sh
function cheat() {
    [ -z "$1" ] && echo "Error: No location information was provided" && return 1
    URL="https://cheat.sh/$1"
    OUT=".cheat.out"

    if [ "$(command -v wget)" ]; then
	wget -q "$URL" -O "$OUT"
	sed "s/Follow.*//g;s/$//" -i "$OUT" && cat "$OUT"
	rm "$OUT"
    elif [ "$(command -v curl)" ]; then
	curl -s "$URL" | sed "s/Follow.*//g;s/$//"
    else
	echo "Error: Either wget or curl needs to be installed"
    fi
}

#* Check if a variable or its value exist or not
# Arguments:
#  1. Variable
#  2. Error message
function __has_args() {
    [ -z "$1" ] && echo "$2"
}

#* Prints random RGB color values
# Arguments:
#  None
function rgb() {
    R="\033[0;91m$(($RANDOM % 255))"
    G="\033[0;92m$(($RANDOM % 255))"
    B="\033[0;94m$(($RANDOM % 255))"
    echo -e "$R $G $B \033[0m"
}

#* Convert the value (an integer) according to the base value
# Arguments:
#  1. Base value
#  2. Integer value
function toconv() {
    __has_args "$1" "Error: Missing base value" && return 1
    __has_args "$2" "Error: Missing integer value" && return 1

    V=$(([##$1]$2))
    echo -e "$V"
}

#* Convert the value (an integer) to hex value
# Arguments:
#  1. Integer value 
function tohex() {
    __has_args "$1" "Error: Missing integer value" && return 1

    V=$(([##16]$1))
    echo -e "0x$V"
}

#* Convert RGB color value to hex color value
# Argumentss:
#  1. R (red) color value
#  2. G (green) color value
#  3. B (blue) color value
function rgb2hex() {
    __has_args "$1" "Error: Missing red color value" && return 1
    __has_args "$2" "Error: Missing green color value" && return 1
    __has_args "$3" "Error: Missing blue color value" && return 1

    HR=$(([##16]$1))
    HG=$(([##16]$2))
    HB=$(([##16]$3))

    [ "${#HR}" -eq 1 ] && { T=$HR HR="0" HR+=$T }
    [ "${#HG}" -eq 1 ] && { T=$HG HG="0" HG+=$T }
    [ "${#HB}" -eq 1 ] && { T=$HB HB="0" HB+=$T }

    echo -e "#$HR$HG$HB"
}

#* Filter linked dependencies using ldd
# Arguments:
#  1. Executable binary or shared object file
function lddl() {
    __has_args "$1" "Error: You need to provide the path of a binary file" && return 1
    ldd "$1" | sed -E "s/[[:space:]]//g;s/=.*|//g;s/\(.*//g;s/.lib64.//g"
}

#* Filter linked dependecies using objdump
# Arguments:
#  1. Executable binary or shared object file
function obdl() {
    __has_args "$1" "Error: You need to provide the path of a binary file" && return 1
    objdump -p "$1" | grep NEEDED | sed "s/NEEDED//g;s/[[:space:]]//g"
}

#* Generate pseudo-numbers from /dev/urandom (uses od)
# Arguments:
#  1. How many numbers (optional, default is 8)
function genurand() {
    case "$1" in
	[0-9]*) n="-N$1" ;;
	"inf") n= ;;
	*) n="-N8" ;;
    esac

    # Don't write n inside quote. We need to provide empty space there.
    od -vAn $n < /dev/urandom | sed "s/[[:space:]]//g"
}

#* Generate pseudo-numbers from /dev/random (uses od)
# Arguments:
#  1. How many numbers (optional, default is 8)
function genrand() {
    case "$1" in
	[0-9]*) n="-N$1" ;;
	"inf") n= ;;
	*) n="-N8" ;;
    esac

    # Don't write n inside quote. We need to provide empty space there.
    od -vAn $n < /dev/random | sed "s/[[:space:]]//g"
}

#* Cat a v4 UUID that Linux kernel generates each time
# Arguments:
#  None
function uuid() {
    uuid_file="/proc/sys/kernel/random/uuid"
    [ ! -f "$uuid_file" ] && {
	echo -n "Error: Couldn't find UUID file. Is procfs mounted? "
	echo -n "Is your Linux kernel version at least >= 4.4? "
	echo "Or are you on a different UNIX-based OS?"
	return 1
    }
    cat "$uuid_file"
}

#* Cat uniq boot ID that Linux kernel generates on each (re-)boot
# Arguments:
#  None
function bootid() {
    boot_id_file="/proc/sys/kernel/random/boot_id"
    [ ! -f "$boot_id_file" ] && {
	echo -n "Error: Couldn't find boot id file. Is procfs mounted? "
	echo -n "Is your Linux kernel version at least >= 3.1? "
	echo "Or are you on a different UNIX-based OS?"
	return 1
    }
    cat "$boot_id_file"
}

#* Show last command's return value
# Arguments:
#  None
function ret() { echo "$?" }

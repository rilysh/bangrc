#* Private function to check whether the command is locatable by shell or not
# Arguments:
#  1. Command name
function __has_command() {
    [ ! "$(command -v $1)" ] && {
        echo "Error: You need to install bc first to use math functions"
    }
}

#* Private function to check whether a variable or its value exist or not
# Arguments:
#  1. Variable name
function __has_args() {
    [ -z "$1" ] && echo "Error: No value was provided"
}

#* Calculate sine
# Arguments:
#  1. Value
function sin() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.17f\n" "$(echo "s($1)" | bc -l)"
}

#* Calculate cosine
# Arguments:
#  1. Value
function cos() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.17f\n" "$(echo "c($1)" | bc -l)"
}

#* Calculate tangent
# Arguments:
#  1. Value
function tan() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.17f\n" "$(echo "s($1) / c($1)" | bc -l)"
}

#* Calculate cotangent
# Arguments:
#  1. Value
function cot() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.17f\n" "$(echo "1 / (s($1) / c($1))" | bc -l)"
}

#* Calculate secant
# Arguments:
#  1. Value
function sec() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.17f\n" "$(echo "1 / s($1)" | bc -l)"
}

#* Calculate cosecant
# Arguments:
#  1. Value
function cosec() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.16f\n" "$(echo "1 / c($1)" | bc -l)"
}

#* Calculate arcsine
# Arguments:
#  1. Value
function asin() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.17f\n" "$(echo "a($1 / sqrt(1 - $1 ^ 2))" | bc -l)"
}

#* Calculate arctangent
# Arguments:
#  1. Value
function atan() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.17f\n" "$(echo "a($1)" | bc -l)"
}

#* Calculate arccotangent
# Arguments:
#  1. Value
function acot() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.17f\n" "$(echo "pi / 2 - a($1)" | bc -l)"
}

#* Calculate arcsecant
# Arguments:
#  1. Value
function asec() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1

    [ "$1" -ge 1 ] && printf "%.16f\n" "$(echo "a(sqrt($1 ^ 2 - 1))" | bc -l)" && return 0
    printf "%.16f\n" "$(echo "pi / 1 - a(sqrt($1 ^ 2 - 1))" | bc -l)"
}

#* Calculate arccosecant
# Arguments:
#  1. Value
function acosec() {
    __has_args "$1" && return 1

    pi=3.14159265358979323846
    [ "$1" -eq 1 ] && printf "%.16f\n" "$pi / 2" && return 0
    [ "$1" -eq -1 ] && printf "%.16f\n" "-$pi / 2" && return 0

    __has_command "bc" && return 1
    [ "$1" -gt 0 ] && printf "%.16f\n" "$(echo a(1 / sqrt($1 ^ 2 - 1)) | bc -l)" && return 0
    printf "%.16f\n" "$(echo -a(1 / sqrt($1 ^ 2 - 1)) | bc -l)"
}

#* Calculate natural log
# Arguments:
#  1. Value
function ln() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.16f\n" "$(echo "l($1)" | bc -l)"
}

#* Calculate common (base 10) logarithm
# Arguments:
#  1. Value
function log() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.16f\n" "$(echo "l(10) / l($1)" | bc -l)"
}

#* Calculate common (base 2) logarithm
# Arguments:
#  1. Value
function log2() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.16f\n" "$(echo "l(2) / l($1)" | bc -l)"
}

#* Calculate common (base 10) logarithm (same as fn log(...))
# Arguments:
#  1. Value
function log10() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.16f\n" "$(echo "l(10) / l($1)" | bc -l)"
}

#* Calculate power of n
# Arguments:
#  1. Base value
#  2. Exponent value
function pow() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%d\n" "$(echo "$1 ^ $2" | bc -l)"
}

#* Calculate exponential value
# Arguments:
#  1. Value
function exp() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf ".18f\n" "$(echo "e($1)" | bc -l)"
}

#* Calculate exponential value with base 2
# Arguments:
#  1. Value
function exp2() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.1f\n" "$(echo "2 ^ $1" | bc -l)"
}

#* Calculate cube root
# Arguments:
#  1. Value
function cbrt() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.18f\n" "$(echo "e(l($1) * (1 / 3))" | bc -l)"
}

#* Result an absolute value
# Arguments:
#  1. Value
function abs() {
    __has_args "$1" && return 1
    [ "$1" -lt 0 ] && printf "%d\n" "$1" && return 0
    printf "%d\n" "$1"
}

#* Calculate bessel fn
# Arguments:
#  1. Value
function bessel() {
    __has_command "bc" && return 1
    __has_args "$1" && return 1
    printf "%.16f\n" "$(echo "j($1, $2)" | bc -l)"
}

#* Calculate fibonacci series
# Arguments:
#  1. Limit
function fib() {
    __has_args "$1" && return 1

    a=1; b=0; n="$1"; r=
    # On a 64-bit CPU, maximum signed int size is 9223372036854775807
    # and bash can't interpret unsigned value.
    [ "$n" -gt 92 ] && echo -1 && return 1
    case "$n" in
	0) echo 0 && return 0 ;;
	[1-2]) echo 1 && return 0 ;;
    esac

    for ((i=1; i < "$n"; i++)); do
	r="$(($a + $b))"
	if [ "$a" -gt "$b" ]; then
	    b="$r"
	else
	    a="$r"
	fi
    done
    echo "$r"
}

#* Calculate radian from degree
# Arguments:
#  1. Value
function rad() {
    __has_args "$1" && return 1
    pi=3.14159265358979323846
    printf "%.10f\n" "$1 * $pi / 180"
}

#* Calculate degree from radian
# Arguments:
#  1. Value
function deg() {
    __has_args "$1" && return 1
    pi=3.14159265358979323846
    printf "%.10f\n" "$1 * 180 / $pi"
}

# None of these constants are calculated in real time. I've scrapped them from Microsoft's CRT library docs.
# For more information see https://learn.microsoft.com/en-us/cpp/c-runtime-library/math-constants?view=msvc-170
function e() { echo "2.71828182845904523536" }
function log2e() { echo "1.44269504088896340736" }
function log10e() { echo "0.434294481903251827651" }
function ln2() { echo "0.693147180559945309417" }
function ln10() { echo "2.30258509299404568402" }
function pi() { echo "3.14159265358979323846" }
function pi2() { echo "1.57079632679489661923" }
function pi4() { echo "0.785398163397448309616" }
function 1pi() { echo "0.318309886183790671538" }
function 2pi() { echo "0.636619772367581343076" }
function 2sqrtpi() { echo "1.12837916709551257390" }
function sqrt2() { echo "1.41421356237309504880" }
function 1sqrt2() { echo "0.707106781186547524401" }

#* PS1 prompt when user in "protected" (non-root) mode
# Arguments:
#  None
function user_ps1() {
    R=$(($RANDOM % 255))
    G=$(($RANDOM % 255))
    B=$(($RANDOM % 255))
    PS1="[\[\033[32m\]\w\033[0m]\[\033[0m\]\n\[\033[1;36m\]\033[38;2;${R};${G};${B}m\u\[\033[1;33m\] ~> \[\033[0m\]"
}

#* PS1 prompt when user in "as-they-wish" (root) mode
# Arguments:
#  None
function root_ps1() {
    PS1="[\[\033[32m\]\w\033[0m]\[\033[0m\]\n\[\033[1;91m\]\u\] ~> \[\033[0m\]"
}

# Run depending if root or not
if [ "$(id -u)" -eq 0 ]; then
    root_ps1
else
    user_ps1
fi

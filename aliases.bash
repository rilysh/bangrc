# Aliases for ls command
alias ll="ls -l"
alias lh="ls -lh"
alias lah="ls -lah"
alias la="ls -a"
alias lA="ls -A"
alias lB="ls -B"
alias laB="ls -aB"
alias llaB="ls -laB"
alias llia="ls -lia"

# Aliases for grep command
alias grep="grep --color=always"
alias gE="grep --color=always -E"
alias gG="grep --color=always -G"
alias gP="grep --color=always -P"
alias ge="grep --color=always -e"
alias gf="grep --color=always -f"
alias gi="grep --color=always -i"
alias gv="grep --color=always -v"
alias gc="grep --color=always -c"
alias gr="grep --color=always -r"
alias gex="grep --color=always --exclude="

# Aliases for egrep command
alias egrep="egrep --color=always"

# Aliases for fgrep command
alias fgrep="fgrep --color=always"

# Aliases for dir command
alias dir="dir --color=always"
alias da="dir --color=always -a"
alias dA="dir --color=always -A"
alias dC="dir --color=always -C"
alias dai="dir --color=always -ai"
alias dah="dir --color=always -ah"

# Aliases for vdir command
alias vdir="vdir --color=always"
alias va="vdir --color=always -a"
alias vA="vdir --color=always -A"
alias vC="vdir --color=always -C"
alias vai="vdir --color=always -ai"
alias vah="vdir --color=always -ah"

# Aliases for git command
alias g="git"
alias gcl="git clone"
alias gd1="git clone --depth 1"
alias gd2="git clone --depth 2"
alias gd3="git clone --depth 3"
alias gi="git init"
alias gad="git add"
alias gapl="git apply"
alias gchk="git checkout"
alias gche="git cherry"
alias gcle="git clean"
alias gcom="git commit"
alias gcomm="git commit"
alias gdi="git diff"
alias gpuh="git push"
alias gpush="git push"
alias gpul="git pull"
alias gpull="git pull"
alias gpru="git prune"
alias gpat="git patch"
alias grev="git revert"
alias gmail="git send-email"
alias gswi="git switch"
alias gswitch="git switch"
alias gwc="git whatchanged"
alias gset="git reset"
alias greset="git reset"

# Color'd warnings and errors for GCC (default is taken from .bashrc)
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

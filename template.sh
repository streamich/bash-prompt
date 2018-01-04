RESET="\[\033[0m\]"
NORMAL="\e[0m"
INVERT="\e[7m"
WHITE="\e[97m"
GRAY="\e[90m"
RED="\[\033[0;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
YELLOW="\[\033[0;33m\]"
BG_RED="\e[41m"
HOT="${NORMAL}${WHITE}${BG_RED}"

function get_commit () {
    echo "$(git rev-parse HEAD 2>&1)"
}

function get_branch () {
    echo "$(git symbolic-ref HEAD 2>&1)"
}

COMMIT=$(get_commit)
BRANCH=$(get_branch)

COMMIT_FORMATTED=""

if [[ $BRANCH == *"fatal:"* ]]; then
    COMMIT_FORMATTED="${HOT} ${COMMIT} ${RESET}"
else
    COMMIT_FORMATTED="${BLUE}${BRANCH#refs/heads/}"
fi

PATH_FORMATTED="$GREEN\w"
TIME_FORMATTED="${NORMAL}${GRAY}\A${RESET}"

LINE_1="${PATH_FORMATTED} ${COMMIT_FORMATTED} ${TIME_FORMATTED}${RESET}"
LINE_2="${YELLOW}>${RESET} "

export PS1="${LINE_1}\n${LINE_2}"

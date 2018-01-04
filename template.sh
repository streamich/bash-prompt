

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

PS_LINE=``

function color () {
    local name=$1
    echo "$name""2"
}

echo $(color "he")

function parse_git_branch {
  PS_BRANCH=''
  PS_FILL=${PS_LINE:0:$COLUMNS}
  if [ -d .svn ]; then
    PS_BRANCH="(svn r$(svn info|awk '/Revision/{print $2}'))"
    return
  elif [ -f _FOSSIL_ -o -f .fslckout ]; then
    PS_BRANCH="(fossil $(fossil status|awk '/tags/{print $2}')) "
    return
  fi
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  PS_BRANCH="${ref#refs/heads/} "
}

PROMPT_COMMAND=parse_git_branch
PS_INFO="$GREEN\w"
PS_GIT="$BLUE\$PS_BRANCH"
PS_TIME="${NORMAL}${GRAY}\A${RESET}"

LINE_1="\${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_GIT}${PS_TIME}${RESET}"
LINE_2="> "

export PS1="${LINE_1}\n${LINE_2}"

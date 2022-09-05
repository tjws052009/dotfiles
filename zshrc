# # env exports
export LANG="ja_JP.UTF-8"
#export LANG="en_US.iso88591"
export LANGUAGE="ja_JP.UTF-8"
export LC_ALL="ja_JP.UTF-8"
export HISTSIZE=2000
export HISTFILESIZE=2000

export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/opt/ruby/bin:$PATH
export RBENV_ROOT=/usr/local/var/rbenv
# export JAVA8_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-15.jdk/Contents/Home/
export EDEN_ENV=“staging”
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# # alias
alias ls='ls -FG' # --color=auto'
alias ll='ls -la'
alias be='bundle exec'
alias mkdirdate='mkdir `date "+%Y%m%d"`'
# alias mysql='mysql --pager="less -n -i -S"'

# aliasではないけど、script上書き
scriptl() {
  LOG_DIR=$HOME/.work_log
  if [ ! -d $LOG_DIR ]; then
    mkdir $LOG_DIR
  fi
  script -a $LOG_DIR/`date +%Y%m%d`
}

PROMPT='%F{green}%B[%T][%n@%C%f$(parse_git_branch)%F{green}]%#%b%f '
RPROMPT=$'[%~]'

# # setting up otpions
setopt prompt_subst
autoload -U compinit
compinit
autoload bashcompinit
bashcompinit
setopt auto_menu
setopt list_packed
setopt auto_pushd
setopt no_beep
setopt sh_word_split
setopt append_history
setopt autolist

# # functions
git_color() {
  local git_status="$(git status 2> /dev/null)"

  COLOR_RED="red"
  COLOR_GREEN="green"

  if [[ $1 == '(master)' ]]; then
    COLOR_RED="magenta"
    COLOR_GREEN="blue"
  fi

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_GREEN
  fi
}

git_color_string() {
  echo "%F{$(git_color $1)}$1%f"
}

parse_git_branch() {
  GIT_BRANCH=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'`

  if [[ -n $GIT_BRANCH ]]; then
    git_color_string $GIT_BRANCH
  fi
}

function chpwd() {
    if [ 200 -lt `ls -1 | wc -l` ]; then
        echo 'has more than 200 files'
    elif [ 20 -gt `ls -1 | wc -l` ]; then
        ls -lah
    else
        ls
    fi
}

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


source <(ecctl generate completions)
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# eval $(docker-machine env default)

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
eval export PATH="/Users/tomohirosugimoto/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME
source '/usr/local/Cellar/jenv/0.5.5_2/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(nodenv init -)"

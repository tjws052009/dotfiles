# # env exports
export LANG="ja_JP.UTF-8"
#export LANG="en_US.iso88591"
export LANGUAGE="ja_JP.UTF-8"
export LC_ALL="ja_JP.UTF-8"
export HISTSIZE=2000
export HISTFILESIZE=2000

export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# # alias
alias ls='ls -FG' # --color=auto'
alias ll='ls -la'
alias be='bundle exec'
alias mkdirdate='mkdir `date "+%Y%m%d"`'
# alias mysql='mysql --pager="less -n -i -S"'
alias devdb='mysql -ulancers -h192.168.33.10 lancers'
alias proddb="mysql -ulancers_office  -p'_33gL?I0Oz' -h192.168.100.254 -P 8025 lancers"

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
setopt nonomatch

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

# peco fucntions
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# peco fucntions
function peco-hist () {
  local selected_dir=$(history -n 1 | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-hist
bindkey '^[' peco-hist

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


# boot2docker settings
export DOCKER_CERT_PATH=/Users/lancers078-01/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

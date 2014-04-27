# # env exports
export LANG="ja_JP.UTF-8"
#export LANG="en_US.iso88591"
export LANGUAGE="ja_JP.UTF-8"
export LC_ALL="ja_JP.UTF-8"
export HISTSIZE=2000
export HISTFILESIZE=2000

export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# # alias
alias ls='ls -FG' # --color=auto'
alias ll='ls -la'

PROMPT='%F{green}%B[%T][%n@%C$(parse_git_branch)]%#%b%f '
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
parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# 実験で enter を押すと、ls と git status が走るようにする
function do_enter() {
    if [ -n "$BUFFER" ]; then
        zle accept-line
        return 0
    fi
    echo
    ls
    # ↓おすすめ
    # ls_abbrev
    # if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    #     echo 
    #     echo -e "\e[0;33m--- git status ---\e[0m"
    #     git status -sb
    # fi
    zle reset-prompt
    return 0
}
zle -N do_enter
bindkey '^m' do_enter

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


eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH=$PATH:/Users/sashamelentyev/go/bin
export PATH=$PATH:/Users/sashamelentyev/Library/Python/3.9/bin
export LANG=en_US.UTF-8
export TERM=screen-256color
export EDITOR=nvim
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR
# ignore duplicate command in history
export HISTCONTROL=ignoredups

alias dl='cd ~/Downloads && la'
alias doc='cd ~/Documents && la'
alias ls="command ls --color"
alias l='ls -l'
alias la='ls -lA'
alias c='clear'
alias с='clear'
alias path='echo -e ${PATH//:/\\n}'
alias week='date +%V'
alias vi='nvim'
alias vim='nvim'

reload() {
  clear
  exec ${SHELL} -l
}

mk() {
  make "$@"
}

mkd() {
  mkdir -p "$@" && cd "$@"
}

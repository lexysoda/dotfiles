# load antibody
# update plugins with antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# locale
export LC_ALL=en_US.UTF-8

# path
path=("$HOME/.jenv/bin" $path)
path=("/usr/local/opt/coreutils/libexec/gnubin" $path)
path=("/usr/local/opt/make/libexec/gnubin" $path)
path=("/usr/local/opt/findutils/libexec/gnubin" $path)
path=("/usr/local/opt/gnu-sed/libexec/gnubin" $path)
path=("/usr/local/opt/grep/libexec/gnubin" $path)
path=("/usr/local/opt/gnu-getopt/bin" $path)
path=("/usr/local/opt/gnu-tar/libexec/gnubin" $path)
path=("/usr/local/opt/curl/bin" $path)
path=("$HOME/MBR/toolbox/bin" $path)
path=("$HOME/MBR/bidder/bin" $path)
path=("$HOME/MBR/management/bin" $path)
path=("$HOME/MBR/broker/bin" $path)
export PATH

# manpath=("/usr/local/opt/coreutils/libexec/gnuman" $manpath)
# export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# hist
setopt inc_append_history
setopt HIST_IGNORE_ALL_DUPS
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

# don't assume cd command
unsetopt autocd

# vi-mode
bindkey -v
export KEYTIMEOUT=1

# vi stuff
export VISUAL=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# starship prompt
eval "$(starship init zsh)"

# Zsh autocompletion
autoload -U compinit && compinit

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX=1

# autocompletion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# tmux colors
export TERM="xterm-256color"

# aliases
source ~/.aliases

# node
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# rbenv
eval "$(rbenv init -)"
export RBENV_VERSION=2.6.0

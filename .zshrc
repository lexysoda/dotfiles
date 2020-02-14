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
path=("$HOME/MBR/toolbox/bin" $path)
path=("$HOME/MBR/bidder/bin" $path)
path=("$HOME/MBR/management/bin" $path)
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
spaceship_vi_mode_enable

# prompt customization
SPACESHIP_PROMPT_ORDER=(user dir host git hg package node ruby elixir xcode swift golang php rust haskell julia docker aws venv conda pyenv dotnet ember kubecontext exec_time line_sep vi_mode jobs char)
SPACESHIP_CHAR_SYMBOL="\u276f "
SPACESHIP_DIR_TRUNC=2
SPACESHIP_VI_MODE_INSERT="i"
SPACESHIP_VI_MODE_NORMAL="n"
SPACESHIP_VENV_SHOW=false
SPACESHIP_CONDA_SHOW=false
SPACESHIP_PYENV_SYMBOL="\ue73c "

# autosuggestion color (standard matches solarized background)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

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

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

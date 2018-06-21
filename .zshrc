# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
  echo "Creating a zgen save"

  # themes
  zgen load bhilburn/powerlevel9k powerlevel9k

  # specify plugins here
  zgen load zsh-users/zsh-completions src
  zgen load iam4x/zsh-iterm-touchbar
  zgen load djui/alias-tips
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting

  # generate the init script from plugins above
  zgen save
fi

path=("$HOME/.jenv/bin" $path)
path=("/usr/local/opt/coreutils/libexec/gnubin" $path)
path=("/usr/local/opt/make/libexec/gnubin" $path)
path=("$HOME/MBR/toolbox/bin" $path)
export PATH

# manpath=("/usr/local/opt/coreutils/libexec/gnuman" $manpath)
# export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

source ~/MBR/toolbox/etc/git-shortcuts

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

unsetopt autocd
bindkey -v

# prompt customization
export DEFAULT_USER='roman'
export POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode command_execution_time status docker_machine rbenv background_jobs time)

#autosuggestion color (standard matches solarized background)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# autocompletion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#ls colors
export CLICOLOR=1
export LSCOLORS=exfxfeaeBxxehehbadacea

# tmux colors
export TERM="xterm-256color"

#aliases
# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ll="ls -hal"
alias sudo='sudo '

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

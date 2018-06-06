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
# is this needed?
export PATH

manpath=("/usr/local/opt/coreutils/libexec/gnuman" $manpath)
# somehow this is needed
export MANPATH

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

unsetopt autocd
bindkey -v

#autosuggestion color (standard matches solarized background)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#ls colors
export CLICOLOR=1
export LSCOLORS=exfxfeaeBxxehehbadacea

#aliases
# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ll="ls -hal"
alias sudo='sudo '

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

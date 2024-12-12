# antidote
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# gcr keyring https://wiki.archlinux.org/title/GNOME/Keyring#SSH_keys
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

# path
path=("$HOME/go/bin" $path)
path=("$HOME/.cargo/bin" $path)
export PATH

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
bindkey jk vi-cmd-mode
bindkey -v '^?' backward-delete-char

# vi stuff
export VISUAL=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Zsh and bash autocompletion
autoload -Uz compinit bashcompinit
compinit
bashcompinit

# autocompletion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# glob hidden files
setopt globdots

# fzf
source <(fzf --zsh)

# work
if [[ "$USER" == "twork" ]]; then
  source ~/development/default-profile/profile
fi

# starship prompt
eval "$(starship init zsh)"

# aliases
source ~/.aliases

# antidote
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# gcr keyring https://wiki.archlinux.org/title/GNOME/Keyring#SSH_keys
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"

# ruby
export GEM_HOME="$(gem env user_gemhome)"

# path
path=("$GEM_HOME/bin" $path)
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

# starship prompt
eval "$(starship init zsh)"

# Zsh autocompletion
autoload -U compinit && compinit

# autocompletion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# glob hidden files
setopt globdots

# aliases
source ~/.aliases

# fzf
source <(fzf --zsh)

# work
source ~/work.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# antidote
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

# path
path=("$HOME/mbr/toolbox/bin" $path)
path=("$HOME/mbr/bidder/bin" $path)
path=("$HOME/mbr/management/bin" $path)
path=("$HOME/mbr/broker/bin" $path)
path=("$HOME/mbr/aws-cli-oidc/bin" $path)
path=("$(ruby -e 'puts Gem.user_dir')/bin" $path)
path=("$HOME/go/bin" $path)
export PATH

# kanbanize token
[[ -r ~/dotfiles/kanbanize ]] && source ~/dotfiles/kanbanize

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

# aliases
source ~/.aliases

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

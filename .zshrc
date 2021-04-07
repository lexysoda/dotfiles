# load antibody
# update plugins with antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags
# http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Shell-state
# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Modifiers
cd ${${(%):-%x}:A:h}

# path
path=("$HOME/MBR/toolbox/bin" $path)
path=("$HOME/MBR/bidder/bin" $path)
path=("$HOME/MBR/management/bin" $path)
path=("$HOME/MBR/broker/bin" $path)
path=("$HOME/go/bin" $path)
export PATH

# manpath=("/usr/local/opt/coreutils/libexec/gnuman" $manpath)
# export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# kanbanize token
[[ -r ~/dotfiles/kanbanize ]] && source ~/dotfiles/kanbanize

# shitbook pro
[[ "$(uname 2> /dev/null)" = "Darwin" && -r .zshrc_mac ]] && source .zshrc_mac

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

# vi stuff
export VISUAL=nvim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# starship prompt
eval "$(starship init zsh)"

# Zsh autocompletion
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# autocompletion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# aliases
source ~/.aliases

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

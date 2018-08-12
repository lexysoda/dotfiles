# load antibody
# update plugins with antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh

# path
path=("$HOME/.jenv/bin" $path)
path=("/usr/local/opt/coreutils/libexec/gnubin" $path)
path=("/usr/local/opt/make/libexec/gnubin" $path)
path=("/usr/local/opt/findutils/libexec/gnubin" $path)
path=("/usr/local/opt/gnu-sed/libexec/gnubin" $path)
path=("$HOME/MBR/toolbox/bin" $path)
path=("$HOME/MBR/bidder/bin" $path)
export PATH

# manpath=("/usr/local/opt/coreutils/libexec/gnuman" $manpath)
# export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# mbr-toolbox
source ~/MBR/toolbox/etc/git-shortcuts

# hist
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

# autosuggestion color (standard matches solarized background)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# autocompletion case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# colorls autocompletion
source $(dirname $(gem which colorls))/tab_complete.sh

# tmux colors
export TERM="xterm-256color"

# aliases
source ~/.aliases

# jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

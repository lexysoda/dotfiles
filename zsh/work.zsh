vpn () {
  nmcli connection up romanaws
}

mbr () {
  vpn

  path=("$HOME/mbr/toolbox/bin" $path)
  path=("$HOME/mbr/bidder/bin" $path)
  path=("$HOME/mbr/management/bin" $path)
  path=("$HOME/mbr/broker/bin" $path)
  path=("$HOME/mbr/aws-cli-oidc/bin" $path)
  export PATH

  # kanbanize token
  [[ -r ~/dotfiles/kanbanize ]] && source ~/dotfiles/kanbanize

  # aws
  source ~/mbr/terraform/scripts/activate.sh
  aws sso login

  # ecr
  ~/mbr/terraform/bin/ecr login
}

ssp () {
  vpn

  source ~/development/default-profile/zsh_profile

  source ~/.aliases

  # starship prompt
  PROMPT='$('/usr/bin/starship' prompt --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="$STARSHIP_CMD_STATUS" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
  RPROMPT='$('/usr/bin/starship' prompt --right --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="$STARSHIP_CMD_STATUS" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
  PROMPT2="$(/usr/bin/starship prompt --continuation)"
}


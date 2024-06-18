vpn () {
  nmcli connection up romanaws.tcp
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

  # starship prompt
  eval "$(starship init zsh)"
}


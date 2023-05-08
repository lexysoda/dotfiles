vpn () {
  nmcli connection up mbr
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

  if ! findmnt ~/development > /dev/null
  then
    sudo mount --bind ~/mbr ~/development
  fi

  export DEFAULT_PROFILE="${HOME}/development/default-profile"
  export ADSCALE_DEV_ROOT="${HOME}/development/adscale"
  export TOOLS_ROOT="${HOME}/development/tools"
  eval "$(${TOOLS_ROOT}/core/bin/core init -)"
  eval "$(source ${TOOLS_ROOT}/scripts/utils/java.sh && envs)"
  export MAVEN_OPTS='-Xmx3g -XX:+TieredCompilation -XX:TieredStopAtLevel=1'

  export PYENV_ROOT="${PYENV_ROOT:-${HOME}/.pyenv}"
  [[ "${PATH}" =~ "${PYENV_ROOT}/bin" ]] || export PATH="${PYENV_ROOT}/bin:${PATH}"
  if command -v pyenv >/dev/null; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
  fi

  source "${DEFAULT_PROFILE}/aws.sh"
  source "${DEFAULT_PROFILE}/k8s.sh"

  path=("$HOME/mbr/toolbox/bin" $path)
  path=("$HOME/mbr/bidder/bin" $path)
  path=("$HOME/mbr/management/bin" $path)
  path=("$HOME/mbr/broker/bin" $path)
  path=("${ADSCALE_DEV_ROOT}/bin" $path)
  export PATH
}


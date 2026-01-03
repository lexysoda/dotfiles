#!/bin/bash
entries="Logout\nSuspend\nReboot\nShutdown"
selected=$(printf "$entries" | walker --dmenu --placeholder "Power Menu")
case $selected in
  Logout) uwsm stop ;;
  Suspend) systemctl suspend ;;
  Reboot) systemctl reboot ;;
  Shutdown) systemctl poweroff ;;
esac

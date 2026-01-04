# Hyprland Setup Documentation

## Overview

This setup uses **Hyprland** (a Wayland compositor) managed by **UWSM** (Universal Wayland Session Manager). This ensures proper handling of environment variables and systemd user sessions, which is critical for things like screen sharing, notifications, and theming.

## Architecture

*   **Compositor:** Hyprland
*   **Session Manager:** `uwsm` (Start via `uwsm start hyprland`)
*   **Bar:** Waybar (Floating style, CSS-based theming)
*   **Notifications:** Mako
*   **Launcher:** Walker
*   **Clipboard:** elephant-clipboard
*   **Wallpaper:** Hyprpaper
*   **Night Light:** hyprsunset + sunsetr (systemd)

## Theming System (Everforest Medium)

The system is designed to switch seamlessly between **Everforest Dark Medium** and **Everforest Light Medium**.

### Structure
*   **Hyprland:** Reads colors from `~/.config/hypr/colors.conf`.
*   **Waybar:** Reads colors from `~/.config/waybar/colors.css`.
*   **Scripts:** `~/dotfiles/scripts/theme-toggle.sh` handles the switching.

### Changing Themes
Run the toggle script to switch modes:
```bash
~/dotfiles/scripts/theme-toggle.sh [dark|light]
```
*   **Dark Mode:** Copies `everforest-dark.*` to `colors.*` and reloads.
*   **Light Mode:** Copies `everforest-light.*` to `colors.*` and reloads.

### Configuration Files
*   **`hypr/everforest-dark.conf`**: Source of truth for dark mode Hyprland colors.
*   **`hypr/everforest-light.conf`**: Source of truth for light mode Hyprland colors.
*   **`waybar/everforest-dark.css`**: Source of truth for dark mode Waybar colors.
*   **`waybar/everforest-light.css`**: Source of truth for light mode Waybar colors.

## Keybindings (Super Key = WINDOWS)

### Core
*   `SUPER + Q`: Terminal (Ghostty)
*   `SUPER + E`: File Manager (Nautilus)
*   `SUPER + B`: Browser (Firefox)
*   `SUPER + SPACE`: App Launcher (Walker)
*   `SUPER + C`: Close Window
*   `SUPER + F`: Fullscreen
*   `SUPER + V`: Toggle Floating

### Window Management
*   `SUPER + Arrow Keys`: Move Focus (Left, Down, Up, Right)
*   `SUPER + 1-0`: Switch Workspace
*   `SUPER + SHIFT + 1-0`: Move Active Window to Workspace
*   `SUPER + P`: Toggle Pseudo-tiling (Dwindle)

### Special
*   `SUPER + S`: Toggle Scratchpad (Special Workspace)
*   `SUPER + SHIFT + S`: Move to Scratchpad

## Maintenance
*   **Logs:** `grep "error" $XDG_RUNTIME_DIR/hypr/$(ls -t $XDG_RUNTIME_DIR/hypr/ | head -n 1)/hyprland.log`
*   **Reload Config:** `hyprctl reload`
*   **Restart Waybar:** `pkill -SIGUSR2 waybar`

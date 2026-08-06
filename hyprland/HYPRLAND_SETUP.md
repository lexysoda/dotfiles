# Hyprland Setup Documentation

## Overview

This setup uses **Hyprland** (a Wayland compositor) managed by **UWSM** (Universal Wayland Session Manager). This ensures proper handling of environment variables and systemd user sessions, which is critical for things like screen sharing, notifications, and theming.

## Architecture

*   **Compositor:** Hyprland (config: `hyprland.lua` — Hyprland switched from the `.conf`/hyprlang format to Lua; `.conf` support is removed starting Hyprland 0.57)
*   **Session Manager:** `uwsm` (Start via `uwsm start hyprland`)
*   **Bar:** Waybar (Floating style, CSS-based theming)
*   **Notifications:** Mako
*   **Launcher:** Walker (requires the separate `elephant` backend service for data providers, e.g. clipboard history, desktop apps, calc)
*   **Wallpaper:** Hyprpaper (config uses the current `wallpaper { }` block syntax; sources: `wallpapers/{dark,light}.png` in the repo root, applied to `~/.config/hypr/wallpaper.png` by the theme toggle)
*   **Night Light:** sunsetr (systemd), backend `auto` — uses Hyprland's native color-management protocol directly, no separate `hyprsunset` process needed

### sunsetr
Enabled as systemd unit: `systemctl --user enable --now sunsetr.service`

## Theming System (Everforest Hard)

The system is designed to switch seamlessly between **Everforest Dark Hard** and **Everforest Light Hard**.

### Structure
*   **Hyprland:** Reads colors from `~/.config/hypr/colors.lua`.
*   **Waybar:** Reads colors from `~/.config/waybar/colors.css`.
*   **Hyprlock:** Reads the active wallpaper from `~/.config/hypr/wallpaper.png`.
*   **Scripts:** `~/dotfiles/scripts/theme-toggle.sh` handles the switching.

### Changing Themes
Run the toggle script to switch modes:
```bash
~/dotfiles/scripts/theme-toggle.sh [dark|light]
```
*   **Dark Mode:** Copies `everforest-dark.*` to `colors.*`, copies `wallpapers/dark.png` to `wallpaper.png`, and reloads.
*   **Light Mode:** Copies `everforest-light.*` to `colors.*`, copies `wallpapers/light.png` to `wallpaper.png`, and reloads.

### Configuration Files
*   **`hypr/everforest-dark.lua`**: Source of truth for dark mode Hyprland colors.
*   **`hypr/everforest-light.lua`**: Source of truth for light mode Hyprland colors.
*   **`waybar/everforest-dark.css`**: Source of truth for dark mode Waybar colors.
*   **`waybar/everforest-light.css`**: Source of truth for light mode Waybar colors.
*   **`wallpapers/dark.png`** / **`wallpapers/light.png`** (repo root): Source wallpaper images per theme.

## Keybindings (Super Key = WINDOWS)

### Core
*   `SUPER + Q`: Terminal (Ghostty)
*   `SUPER + E`: File Manager (Nautilus)
*   `SUPER + B`: Browser (Firefox)
*   `SUPER + SPACE`: App Launcher (Walker)
*   `SUPER + C`: Close Window
*   `SUPER + F`: Fullscreen
*   `SUPER + V`: Toggle Floating
*   `SUPER + SHIFT + L`: Lock Screen (Hyprlock)

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

## Lua LSP Autocompletion

Hyprland ships Lua type stubs at `/usr/share/hypr/stubs/hl.meta.lua` (installed by the `hyprland` package).
Neovim's `lazydev.nvim` (configured in `nvim/.config/nvim/plugin/lsp.lua`) loads this stub automatically for
any open Lua buffer that references the `hl` API (matched via a `words` trigger on `hl%.`), giving
autocompletion for `hl.bind`, `hl.config`, `hl.dsp`, `hl.window_rule`, etc. — directory-agnostic, so it
also covers any future split-out config files (e.g. `binds.lua`, `rules.lua`) without extra setup.

## Known Issues / Open Items

*   **hypridle:** Installed (`hypridle.service`) but currently **disabled and unconfigured** — no
    `~/.config/hypr/hypridle.conf` exists in this repo. Idle-based screen lock / DPMS timeout is not
    currently set up. Decide whether to configure and enable it, or leave it unused.
*   **Waybar `custom/media`:** The `custom/media` module in `waybar/config.jsonc` execs
    `~/.config/waybar/mediaplayer.py`, which does not currently exist in this repo — the module will
    silently show nothing. A working version (based on Waybar's own upstream example script) was
    prototyped and reverted; a better solution is intended to be revisited later, not fixed as-is.
*   **Walker/elephant clipboard theming and provider config:** `elephant`'s own config
    (`~/.config/elephant/`) is unmanaged/default — not part of this repo. If provider behavior
    (clipboard history retention, etc.) needs tuning, that lives outside `hyprland/.config/walker/`.

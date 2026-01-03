#!/bin/bash

# Theme Toggle Script
# Usage: ./theme-toggle.sh [dark|light]

MODE=$1

if [ -z "$MODE" ]; then
    # Toggle mode based on current link
    if grep -q "everforest-dark" "$HOME/.config/hypr/colors.conf"; then
        MODE="light"
    else
        MODE="dark"
    fi
fi

echo "Switching to $MODE mode..."

# Paths (Adjust these if your dotfiles are not in ~/dotfiles)
WAYBAR_CONFIG="$HOME/.config/waybar"
HYPR_CONFIG="$HOME/.config/hypr"
GTK_CONFIG="$HOME/.config/gtk-3.0/settings.ini"

# Files to copy from
WAYBAR_THEME="$HOME/dotfiles/waybar/.config/waybar/everforest-$MODE.css"
HYPR_THEME="$HOME/dotfiles/hypr/.config/hypr/everforest-$MODE.conf"
WALLPAPER="$HOME/dotfiles/wallpapers/$MODE.png" # You need to place wallpapers here!

# 1. Apply Waybar Theme
cp "$WAYBAR_THEME" "$WAYBAR_CONFIG/colors.css"

# 2. Apply Hyprland Theme
cp "$HYPR_THEME" "$HYPR_CONFIG/colors.conf"

# 3. Apply GTK Theme (Optional - requires installed themes)
if [ "$MODE" == "dark" ]; then
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    # sed -i 's/gtk-theme-name=.*/gtk-theme-name=Gruvbox-Dark/g' "$GTK_CONFIG"
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    # sed -i 's/gtk-theme-name=.*/gtk-theme-name=Gruvbox-Light/g' "$GTK_CONFIG"
fi

# 4. Update Wallpaper
# This assumes you have 'dark.png' and 'light.png' in a wallpapers folder
if [ -f "$WALLPAPER" ]; then
    cp "$WALLPAPER" "$HYPR_CONFIG/wallpaper.png"
    # Preload and unload to force refresh without restarting hyprpaper if running
    hyprctl hyprpaper unload "all"
    hyprctl hyprpaper preload "$HYPR_CONFIG/wallpaper.png"
    hyprctl hyprpaper wallpaper ",$HYPR_CONFIG/wallpaper.png"
fi

# 5. Apply Ghostty Theme
GHOSTTY_CONFIG="$HOME/.config/ghostty/config"
if [ -f "$GHOSTTY_CONFIG" ]; then
    if [ "$MODE" == "dark" ]; then
        sed -i "s/^theme = .*/theme = Everforest Dark Hard/" "$GHOSTTY_CONFIG"
    else
        sed -i "s/^theme = .*/theme = Everforest Light Med/" "$GHOSTTY_CONFIG"
    fi
    # Ghostty reloads automatically
fi

# 6. Reload Apps
pkill -SIGUSR2 waybar # Reload Waybar
# Hyprland reloads config automatically when changed, but we force it to read colors
hyprctl reload

echo "Done!"

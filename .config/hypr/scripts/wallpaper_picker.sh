#!/sbin/zsh
source ~/.zshrc
export DISPLAY=:0
export XDG_RUNTIME_DIR=/run/user/$(id -u)

WALLPAPER_DIR="$HOME/wallpapers"
WALLPAPER_SCRIPT="$HOME/.config/hypr/scripts/set_wallpaper.sh"
CHOOSER_FILE="/tmp/yazi_chooser.txt"

# Check if Yazi is installed
if ! command -v yazi &>/dev/null; then
    echo "Yazi is not installed. Install it with: sudo pacman -S yazi"
    exit 1
fi

# Launch Yazi in chooser mode
yazi "$WALLPAPER_DIR" --chooser-file "$CHOOSER_FILE"

# Wait for Yazi to exit and check if a file was chosen
if [[ -s "$CHOOSER_FILE" ]]; then
    SELECTED_WALLPAPER=$(cat "$CHOOSER_FILE")
    "$WALLPAPER_SCRIPT" "$SELECTED_WALLPAPER"
else
    echo "No wallpaper selected."
fi

# Clean up chooser file
rm -f "$CHOOSER_FILE"

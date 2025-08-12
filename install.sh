#!/usr/bin/env bash
set -e

echo "=== Manjaro Sway Developer Bootstrap ==="

# ----------------------------
# Update system
# ----------------------------
sudo pacman -Syu --noconfirm

# ----------------------------
# Install essential tools
# ----------------------------
echo "=== Installing essential Wayland tools ==="
sudo pacman -S --noconfirm \
  neovim \
  lazygit \
  kitty

# ----------------------------
# Setup git
# ----------------------------
git config --global user.email "coen@tcr-it.nl"
git config --global user.name "Coen de Wit"

# ----------------------------
# Terminal Kitty Config
# ----------------------------
echo "=== Overriding  Sway config ==="
mkdir -p ~/.config/sway

cat >~/.config/sway/definitions.d/terminal.conf <<'EOF'
set $term kitty
set $term_cwd kitty
set $term_float kitty
EOF

cat >~/.config/sway/definitions.d/monitor.conf <<'EOF'
output * scale 2
EOF

cat >~/.config/sway/definitions.d/keyboard.conf <<'EOF'
input "type:keyboard" {
    repeat_delay 150 
    repeat_rate 50 
}
EOF

cat >~/.config/kitty/kitty.conf <<'EOF'
cursor_trail 10
font_family JetBrains Mono Nerd
font_size 10.0
EOF

# ----------------------------
# Neovim Config
# ----------------------------
rm -rf ~/.config/nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

# ----------------------------
# Finish
# ----------------------------
echo "=== Bootstrap complete! ==="
echo "Restart Sway to apply changes:  $mod+Shift+c"

#!/usr/bin/env bash
set -e

echo "=== Manjaro Sway Developer Bootstrap ==="

# ----------------------------
# 1. Update system
# ----------------------------
sudo pacman -Syu --noconfirm

# ----------------------------
# 2. Install essential tools
# ----------------------------
echo "=== Installing essential Wayland tools ==="
sudo pacman -S --noconfirm \
  neovim \
  kitty \
  ttf-jetbrains-mono nerd-fonts

# ----------------------------
# Terminal Kitty Config
# ----------------------------
echo "=== Overriding  Sway config ==="
mkdir -p ~/.config/sway

cat > ~/.config/sway/definitions.d <<'EOF'
set $term kitty
set $term_cwd kitty
set $term_float kitty
EOF

cat > ~/.config/kitty/kitty.conf <<'EOF'
cursor_trail 10
font_family JetBrains Mono
font_size 10.0
EOF

# ----------------------------
# Neovim Config
# ----------------------------
git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

# ----------------------------
# 5. Finish
# ----------------------------
echo "=== Bootstrap complete! ==="
echo "Restart Sway to apply changes:  $mod+Shift+e"

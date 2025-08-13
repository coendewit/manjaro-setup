#!/bin/bash

set -e

echo "=== Manjaro Sway Developer Bootstrap ==="

# ----------------------------
# Update system
# ----------------------------
echo "=== Update system ==="
sudo pacman -Syu --noconfirm

# ----------------------------
# Configuration files
# ----------------------------
for script in ./configs/*.sh; do
  source "$script"
done

# ----------------------------
# Install all apps
# ----------------------------
for script in ./apps/*.sh; do
  source "$script"
done

# ----------------------------
# Finish
# ----------------------------
echo "=== Bootstrap complete! ==="
echo "Restart Sway to apply changes: SUPER+Shift+c"

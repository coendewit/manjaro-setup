# ----------------------------
# Zodide Installation & Config
# ----------------------------
sudo pacman -S --noconfirm zoxide fzf

tee -a ~/.zshrc <<'EOF'
eval "$(zoxide init zsh)"
EOF

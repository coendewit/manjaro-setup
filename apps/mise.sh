echo "=== Mise installation ==="

curl https://mise.run | sh

echo "eval \"\$(~/.local/bin/mise activate zsh)\"" >>~/.zshrc

echo "=== .Net installation ==="
mise use --global dotnet

echo "=== Golang installation ==="
mise use --global go

echo "=== Mise installation ==="

if ! command -v mise &>/dev/null; then
  curl https://get.mise.run | sh
  echo "eval \"\$(~/.local/bin/mise activate zsh)\"" >>~/.zshrc
fi

echo "=== .Net installation ==="
if ! command -v dotnet &>/dev/null; then
  mise install dotnet
fi

echo "=== Golang installation ==="
if ! command -v go &>/dev/null; then
  mise install go
fi

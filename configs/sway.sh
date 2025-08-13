# ----------------------------
# Sway overrides
# ----------------------------
echo "=== Sway overrides ==="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

mkdir -p ~/.config/sway

cp -r "$SCRIPT_DIR/sway/" ~/.config/sway/definitions.d/

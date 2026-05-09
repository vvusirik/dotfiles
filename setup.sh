DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
for dir in "$DOTFILES_DIR"/*/; do
  stow --target "$HOME" -d "$DOTFILES_DIR" "$(basename "$dir")"
done

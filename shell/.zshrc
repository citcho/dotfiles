# mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# modular configs
for file in ~/.config/zsh/*.zsh; do
  [ -r "$file" ] && source "$file"
done
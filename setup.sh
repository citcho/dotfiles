#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

echo "== Install zsh =="

if ! command -v zsh >/dev/null; then
  sudo apt update
  sudo apt install -y zsh build-essential
fi

echo "== Install Homebrew =="

if ! command -v brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "== Setup Brew ENV =="

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

echo "== Install Brew Packages =="

brew bundle --file="$DOTFILES/brew/Brewfile"

echo "== Link dotfiles =="

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/zsh"
mkdir -p "$HOME/.config/mise"

ln -sf "$DOTFILES/shell/.zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES/shell/.zshrc" "$HOME/.zshrc"

ln -sf "$DOTFILES/shell/zsh/aliases.zsh" "$HOME/.config/zsh/aliases.zsh"
ln -sf "$DOTFILES/shell/zsh/env.zsh" "$HOME/.config/zsh/env.zsh"
ln -sf "$DOTFILES/shell/zsh/plugins.zsh" "$HOME/.config/zsh/plugins.zsh"

ln -sf "$DOTFILES/config/starship.toml" "$HOME/.config/starship.toml"
ln -sf "$DOTFILES/config/mise/config.toml" "$HOME/.config/mise/config.toml"

echo "== Done =="

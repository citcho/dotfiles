. "$HOME/.local/bin/env"

if [ -f ~/dotfiles/.aliases ]; then
    . ~/dotfiles/.aliases
fi

export PATH="$HOME/bin:$PATH"

if [ ! -f /usr/local/bin/starship ]; then
    curl -sS https://starship.rs/install.sh | sh
fi
eval "$(starship init zsh)"

if [ ! -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | /bin/bash
fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if [ ! -f /home/linuxbrew/.linuxbrew/bin/aqua ]; then
    /home/linuxbrew/.linuxbrew/bin/brew install aquaproj/aqua/aqua
fi
export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
export AQUA_GLOBAL_CONFIG="$HOME/dotfiles/aqua.yaml"

export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# dotfiles

## Setup

```sh
cd ~

# clone repository
git clone git@github.com:citcho/dotfiles.git
cd dotfiles

# install requirements (Ubuntu / WSL)
sudo apt update
sudo apt install -y zsh make

# setup
make

# trust mise config
mise trust

# set default shell
chsh -s $(which zsh)

# reload shell
source ~/.zprofile
exec zsh
```

---

## zsh environment

```
zsh
 ├ starship (prompt)
 ├ mise (runtime manager)
 ├ zoxide (smart cd)
 ├ atuin (history search)
 ├ fzf (fuzzy finder)
 ├ eza (ls replacement)
 ├ bat (cat replacement)
 ├ ripgrep (grep replacement)
 └ fd (find replacement)
```

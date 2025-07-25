#!/usr/bin/env zsh
set -ue

helpmsg() {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}

link_to_homedir() {
  command echo "backup old dotfiles..."
  if [ ! -d "$HOME/.dotbackup" ];then
    command echo "$HOME/.dotbackup not found. Auto Make it"
    command mkdir "$HOME/.dotbackup"
  fi

  local script_dir="$(cd "$(dirname "$0")" && pwd -P)"
  local dotdir=$(dirname ${script_dir})
  if [[ "$HOME" != "$dotdir" ]];then
    for f in $dotdir/.??*; do
      [[ `basename $f` == ".git" ]] && continue
      if [[ -L "$HOME/`basename $f`" ]];then
        command rm -f "$HOME/`basename $f`"
      fi
      if [[ -e "$HOME/`basename $f`" ]];then
        command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
      fi
      command ln -snf $f $HOME
    done
  else
    command echo "same install src dest"
  fi

  if [ ! -d "$HOME/.config" ]; then
    command mkdir "$HOME/.config"
  fi
  command ln -snf "$script_dir/starship.toml" "$HOME/.config/starship.toml"

  local vscode_settings_src="$script_dir/vscode/settings.json"
  local vscode_settings_dest="$HOME/.vscode-server/data/Machine/settings.json"
  if [ -f "$vscode_settings_src" ]; then
    if [ ! -d "$(dirname "$vscode_settings_dest")" ]; then
      command mkdir -p "$(dirname "$vscode_settings_dest")"
    fi
    command ln -snf "$vscode_settings_src" "$vscode_settings_dest"
  fi
}

while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done

link_to_homedir
git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!!! \e[m"

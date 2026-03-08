setup:
	bash setup.sh

brew:
	brew bundle --file=brew/Brewfile

link:
	bash setup.sh

update:
	brew update
	brew upgrade

extension: # code --list-extensions > vscode/extensions.txt を実行してからこのコマンドを実行する
	cat vscode/extensions.txt | xargs -L 1 code --install-extension

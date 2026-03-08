setup:
	bash setup.sh

brew:
	brew bundle --file=brew/Brewfile

link:
	bash setup.sh

update:
	brew update
	brew upgrade

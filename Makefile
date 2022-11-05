all:
	[ -f ~/.aliases ] || ln -s $(PWD)/aliases ~/.aliases
	[ -f ~/.config/nvim ] || ln -s $(PWD)/config/nvim ~/.config/nvim
	[ -f ~/.exports ] || ln -s $(PWD)/exports ~/.exports
	[ -f ~/.functions ] || ln -s $(PWD)/functions ~/.functions
	[ -f ~/.includes ] || ln -s $(PWD)/includes ~/.includes
	[ -f ~/.path ] || ln -s $(PWD)/path ~/.path
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc

clean:
	[ -h ~/.aliases ] && unlink ~/.aliases
	[ -L ~/.config/nvim ] && unlink ~/.config/nvim
	[ -h ~/.exports ] && unlink ~/.exports
	[ -h ~/.functions ] && unlink ~/.functions
	[ -h ~/.includes ] && unlink ~/.includes
	[ -h ~/.path ] && unlink ~/.path
	[ -h ~/.tmux.conf ] && unlink ~/.tmux.conf
	[ -h ~/.vimrc ] && unlink ~/.vimrc
	[ -h ~/.zshrc ] && unlink ~/.zshrc

.PHONY: all

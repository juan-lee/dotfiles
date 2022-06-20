all:
	[ -f ~/.aliases ] || ln -s $(PWD)/aliases ~/.aliases
	[ -f ~/.config/nvim ] || ln -s $(PWD)/config/nvim ~/.config/nvim
	[ -f ~/.exports ] || ln -s $(PWD)/exports ~/.exports
	[ -f ~/.functions ] || ln -s $(PWD)/functions ~/.functions
	[ -f ~/.path ] || ln -s $(PWD)/path ~/.path
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc

clean:
	[ -h ~/.aliases ] && rm ~/.aliases
	[ -h ~/.config/nvim/init.vim ] && rm ~/.config/nvim/init.vim
	[ -h ~/.exports ] && rm ~/.exports
	[ -h ~/.functions ] && rm ~/.functions
	[ -h ~/.path ] && rm ~/.path
	[ -h ~/.tmux.conf ] && rm ~/.tmux.conf
	[ -h ~/.vimrc ] && rm ~/.vimrc
	[ -h ~/.zshrc ] && rm ~/.zshrc

.PHONY: all

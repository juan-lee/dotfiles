all:
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.Xdefaults ] || ln -s $(PWD)/Xdefaults ~/.Xdefaults
	[ -f ~/.alias ] || ln -s $(PWD)/alias ~/.alias
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/init.vim ~/.config/nvim/init.vim

clean:
	[ -h ~/.vimrc ] && rm ~/.vimrc
	[ -h ~/.zshrc ] && rm ~/.zshrc
	[ -h ~/.tmux.conf ] && rm ~/.tmux.conf
	[ -h ~/.Xdefaults ] && rm ~/.Xdefaults
	[ -h ~/.alias ] && rm ~/.alias
	[ -h ~/.config/nvim/init.vim ] && rm ~/.config/nvim/init.vim

.PHONY: all

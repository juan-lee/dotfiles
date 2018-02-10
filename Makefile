all:
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/init.vim ~/.config/nvim/init.vim
	[ -f ~/.profile ] || ln -s $(PWD)/profile ~/.profile
	[ -f ~/.aliases ] || ln -s $(PWD)/aliases ~/.aliases
	[ -f ~/.exports ] || ln -s $(PWD)/exports ~/.exports
	[ -f ~/.functions ] || ln -s $(PWD)/functions ~/.functions
	[ -f ~/.path ] || ln -s $(PWD)/path ~/.path
	[ -f ~/.inputrc ] || ln -s $(PWD)/inputrc ~/.inputrc
	[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
	[ -f ~/.bash_profile ] || ln -s $(PWD)/bash_profile ~/.bash_profile

clean:
	[ -h ~/.vimrc ] && rm ~/.vimrc
	[ -h ~/.zshrc ] && rm ~/.zshrc
	[ -h ~/.tmux.conf ] && rm ~/.tmux.conf
	[ -h ~/.config/nvim/init.vim ] && rm ~/.config/nvim/init.vim
	[ -h ~/.profile ] && rm ~/.profile
	[ -h ~/.aliases ] && rm ~/.aliases
	[ -h ~/.exports ] && rm ~/.exports
	[ -h ~/.functions ] && rm ~/.functions
	[ -h ~/.path ] && rm ~/.path
	[ -h ~/.inputrc ] && rm ~/.inputrc
	[ -h ~/.bashrc ] && rm ~/.bashrc
	[ -h ~/.bash_profile ] && rm ~/.bash_profile

.PHONY: all

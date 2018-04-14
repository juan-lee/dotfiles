all:
	[ -f ~/.aliases ] || ln -s $(PWD)/aliases ~/.aliases
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/init.vim ~/.config/nvim/init.vim
	[ -f ~/.exports ] || ln -s $(PWD)/exports ~/.exports
	[ -f ~/.functions ] || ln -s $(PWD)/functions ~/.functions
	[ -f ~/.path ] || ln -s $(PWD)/path ~/.path
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.zsh_profile ] || ln -s $(PWD)/zsh_profile ~/.zsh_profile
	[ -f ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc

clean:
	[ -h ~/.aliases ] && rm ~/.aliases
	[ -h ~/.config/nvim/init.vim ] && rm ~/.config/nvim/init.vim
	[ -h ~/.exports ] && rm ~/.exports
	[ -h ~/.functions ] && rm ~/.functions
	[ -h ~/.path ] && rm ~/.path
	[ -h ~/.tmux.conf ] && rm ~/.tmux.conf
	[ -h ~/.vimrc ] && rm ~/.vimrc
	[ -h ~/.zsh_profile ] && rm ~/.zsh_profile
	[ -h ~/.zshrc ] && rm ~/.zshrc

.PHONY: all

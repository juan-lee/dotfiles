all:
	[ -L ~/.aliases ] || ln -s $(PWD)/aliases ~/.aliases
	[ -L ~/.config/nvim ] || ln -s $(PWD)/config/nvim ~/.config/nvim
	[ -L ~/.exports ] || ln -s $(PWD)/exports ~/.exports
	[ -L ~/.functions ] || ln -s $(PWD)/functions ~/.functions
	[ -L ~/.includes ] || ln -s $(PWD)/includes ~/.includes
	[ -L ~/.path ] || ln -s $(PWD)/path ~/.path
	[ -L ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -L ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -L ~/.zshrc ] || ln -s $(PWD)/zshrc ~/.zshrc
	[ -L $(ZSH)/custom/themes/jpang.zsh-theme ] || ln -s $(PWD)/jpang.zsh-theme $(ZSH)/custom/themes/jpang.zsh-theme

clean:
	[ -L ~/.aliases ] && unlink ~/.aliases
	[ -L ~/.config/nvim ] && unlink ~/.config/nvim
	[ -L ~/.exports ] && unlink ~/.exports
	[ -L ~/.functions ] && unlink ~/.functions
	[ -L ~/.includes ] && unlink ~/.includes
	[ -L ~/.path ] && unlink ~/.path
	[ -L ~/.tmux.conf ] && unlink ~/.tmux.conf
	[ -L ~/.vimrc ] && unlink ~/.vimrc
	[ -L ~/.zshrc ] && unlink ~/.zshrc
	[ -L $(ZSH)/custom/themes/jpang.zsh-theme ] && unlink $(ZSH)/custom/themes/jpang.zsh-theme

.PHONY: all

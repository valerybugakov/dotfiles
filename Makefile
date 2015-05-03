DOTFILES_PATH=$(HOME)/dotfiles

install:
	$(MAKE) dots
	$(MAKE) shell
	$(MAKE) vim

dots:
	mkdir -p $(DOTFILES_PATH)
	mkdir -p $(HOME)/bin
	git clone https://github.com/valerybugakov/dotfiles.git $(DOTFILES_PATH)
	find ~/dotfiles/dots -name '.*' | xargs -I % ln -sf % ~

shell:
	cat $(DOTFILES_PATH)/ohmyzsh.sh | sh
	sudo echo `which bash` >> /etc/shells
	chsh -s /bin/zsh

vim:
	curl -o $(HOME)/vim.tar.bz2 ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
	bzcat $(HOME)/vim.tar.bz2 > $(HOME)/vim.tar
	tar xvf $(HOME)/vim.tar
	cd $(HOME)/vim74 && $(MAKE)
	ln -sf $(HOME)/vim74/src/vim $(HOME)/bin/
	git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +PluginInstall +qall

remove:
	rm -rf $(DOTFILES_PATH)
	rm -rf $(HOME)/vim74
	rm -rf $(HOME)/vim.tar


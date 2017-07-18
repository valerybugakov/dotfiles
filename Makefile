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

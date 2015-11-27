DOTFILES_PATH=$HOME/dotfiles
DOTFILES_REPO=https://github.com/valerybugakov/dotfiles.git
VUNDLE_PATH=$HOME/.vim/bundle/vundle
VUNDLE_REPO=git://github.com/gmarik/Vundle.vim

if [ -d $DOTFILES_PATH ]; then
  sudo rm -r $DOTFILES_PATH
fi
mkdir -p $DOTFILES_PATH
git clone $DOTFILES_REPO $DOTFILES_PATH
find ~/dotfiles/dots -name '.*' | xargs -I % ln -sfv % ~

cat $DOTFILES_PATH/ohmyzsh.sh | sh
sudo echo `which bash` >> /etc/shells
chsh -s /bin/zsh

# mkdir -p $HOME/bin
# curl -o $HOME/vim.tar.bz2 ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
# bzcat $HOME/vim.tar.bz2 > $HOME/vim.tar
# tar xvf $HOME/vim.tar
# cd $HOME/vim74 && make
# ln -sf $HOME/vim74/src/vim $HOME/bin/

git clone $VUNDLE_REPO $VUNDLE_PATH
vim +PluginInstall +qall

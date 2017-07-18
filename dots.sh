DOTFILES_PATH=$HOME/dotfiles
DOTFILES_REPO=https://github.com/valerybugakov/dotfiles.git
TERMINFO_PATH=$HOME/xterm-256color-italic.terminfo

# if [ -d $DOTFILES_PATH ]; then
#   sudo rm -r $DOTFILES_PATH
# fi
# mkdir -p $DOTFILES_PATH

git clone $DOTFILES_REPO $DOTFILES_PATH
find "$DOTFILES_PATH/dots" -name '.*' | xargs -I % ln -sfv % ~

cat $DOTFILES_PATH/ohmyzsh.sh | sh
sudo echo `which bash` >> /etc/shells
chsh -s /bin/zsh

# Add iterm terminfo file
cp ./xterm-256color-italic.terminfo $TERMINFO_PATH
tic xterm-256color-italic.terminfo

vim +PlugInstall +qall

DOTFILES_PATH=$HOME/dotfiles
DOTFILES_REPO=https://github.com/valerybugakov/dotfiles.git
VUNDLE_PATH=$HOME/.vim/bundle/vundle
VUNDLE_REPO=git://github.com/gmarik/Vundle.vim
JSFORMATTER=./.vim/.vim/jsformatter.vim
FORMATTERS_PATH="${VUNDLE_PATH}/autoload/airline/extensions/tabline/formatters/"
TERMINFO_PATH=$HOME/xterm-256color-italic.terminfo

if [ -d $DOTFILES_PATH ]; then
  sudo rm -r $DOTFILES_PATH
fi
mkdir -p $DOTFILES_PATH

git clone $DOTFILES_REPO $DOTFILES_PATH
find ~/dotfiles/dots -name '.*' | xargs -I % ln -sfv % ~

cat $DOTFILES_PATH/ohmyzsh.sh | sh
# sudo echo `which bash` >> /etc/shells
# chsh -s /bin/zsh

git clone $VUNDLE_REPO $VUNDLE_PATH

# Add vim tab-title formatter
mkdir -p $FORMATTERS_PATH
cp $JSFORMATTER $FORMATTERS_PATH

# Add iterm terminfo file
cp ./xterm-256color-italic.terminfo $TERMINFO_PATH
tic xterm-256color-italic.terminfo

vim +PlugInstall +qall

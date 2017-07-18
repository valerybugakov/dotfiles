# Brew cask

brew install caskroom/cask/brew-cask

brew tap caskroom/versions
brew tap caskroom/fonts

apps=(
  1password

  slack
  telegram
  skype
  screenhero

  java
  the-unarchiver

  haskell-platform

  sequel-pro
  dropbox

  google-chrome
  google-chrome-canary
  firefox
  opera-developer
  torbrowser-ru

  quicklook-json
  qlmarkdown
  quicklook-csv
  qlimagesize

  iterm2
  hyper
  rescuetime
  anybar
  postman
  choosy
  quitter

  flux

  vlc
  utorrent
  sopcast
  spotify

  zoom
  ngrok
  karabiner-elements

  docker

  sublime-text
  intellij-idea-ce
  visual-studio-code
  atom
)

fonts=(
  font-hack
  font-ubuntu
  font-roboto

  font-firacode-nerd-font
  font-ubuntumono-nerd-font
)

brew cask install ${apps[@]}
brew cask install ${fonts[@]}

brew cask cleanup

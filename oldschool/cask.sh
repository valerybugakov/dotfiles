# Brew cask

brew install caskroom/cask/brew-cask

brew tap caskroom/versions
brew tap caskroom/fonts

apps=(
  macvim

  1password

  zoomus
  slack
  telegram
  skype

  java
  haskell-platform

  sequel-pro
  dropbox

  google-chrome
  google-chrome-canary
  firefox
  opera-developer
  torbrowser-ru

  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlimagesize
  webpquicklook
  suspicious-package
  quicklookase
  qlvideo
  quicklook-csv

  iterm2
  hyper

  postman
  rescuetime

  vlc
  utorrent
  sopcast
  spotify

  ngrok
  karabiner-elements

  docker
  osxfuse

  sublime-text-3
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

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
  screenhero

  java
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

  cerebro
  anybar
  postman
  rescuetime

  flux

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

  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
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

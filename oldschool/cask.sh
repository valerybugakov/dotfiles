# Brew cask

brew tap homebrew/cask

brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

apps=(
  macvim

  1password
  figma

  omnidisksweeper
  webtorrent
  pdf-expert
  the-unarchiver
  colorsnapper
  ivpn
  qbittorrent
  itsycal
  notion
  alacritty
  ilya-birman-typography-layout

  zoom
  slack
  telegram
  skype

  openjdk
  haskell-stack

  sequel-pro
  dropbox

  google-chrome
  google-chrome-canary
  firefox
  opera-developer
  brave-browser

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

  vlc
  spotify

  ngrok
  karabiner-elements

  docker
  # osxfuse

  svn
  sublime-text
  visual-studio-code
)

fonts=(
  font-hack
  font-ubuntu
  font-roboto

  font-fira-code-nerd-font
  font-ubuntu-mono-nerd-font
)

brew install cask ${apps[@]}
brew install cask ${fonts[@]}

brew cleanup

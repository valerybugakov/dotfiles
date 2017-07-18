# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install all software
./brew.sh
./cask.sh
./npm.sh
./sketch.sh
./apm.sh
./dots.sh

# Install Scm Breeze
git clone git://github.com/ndbroadbent/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

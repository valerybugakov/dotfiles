mkdir tempdots
curl -L https://api.github.com/repos/valerybugakov/dotfiles/tarball | tar xvf - -C tempdots --strip=1
cd ./tempdots
./install.sh
cd ..
rm -r ./tempdots

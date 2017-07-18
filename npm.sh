# Install npm scripts globally
sudo -v

npmscripts=(
  node-gyp

  which
  caniuse-cmd
  tldr
  jscodeshift

  babel-cli
  webpack
  eslint
  eslint_d

  flow-vim-quickfix
  flow
  flow-bin
  flow-typed
)

npm install -g ${npmscripts[@]}

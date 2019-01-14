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
  plop

  ts-node
  tslint
  typescript
)

npm install -g ${npmscripts[@]}

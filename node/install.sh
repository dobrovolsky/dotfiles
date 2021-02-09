NODE_VERSION=14.15.1

nodenv install "${NODE_VERSION}"
nodenv global "${NODE_VERSION}"
npm install -g yarn

nodenv rehash

yarn global add markmap-cli

nodenv rehash

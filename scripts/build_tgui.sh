#!/bin/bash
set -euo pipefail

source ~/.nvm/nvm.sh
nvm install 12
nvm use 12
npm install --global yarn

cd tgui
chmod +x bin/tgui
bin/tgui --ci
cd ..

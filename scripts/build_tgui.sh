#!/bin/bash
set -euo pipefail

## Setup NVM
if [[ -e ~/.nvm/nvm.sh ]]; then
	source ~/.nvm/nvm.sh
	nvm use "12"
fi

echo "Building 'tgui'"
cd "tgui"
bin/tgui --ci
cd ..

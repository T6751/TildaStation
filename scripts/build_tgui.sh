#!/bin/bash
set -euo pipefail

## Setup NVM

nvm use "${NODE_VERSION}"

echo "Building 'tgui'"
cd tgui
bin/tgui --ci
cd ..

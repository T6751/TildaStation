#!/bin/bash
set -euo pipefail

npm install --global yarn

cd tgui
chmod +x bin/tgui
bin/tgui --ci
cd ..

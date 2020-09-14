#!/bin/bash
set -euo pipefail

cd tgui
chmod +x bin/tgui
bin/tgui --ci
cd ..

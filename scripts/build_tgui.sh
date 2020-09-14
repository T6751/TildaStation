#!/bin/bash
set -euo pipefail

echo "Building 'tgui'"
cd tgui
bin/tgui --ci
cd ..

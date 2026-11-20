#!/usr/bin/env bash
# Собирает zip каждого скила в папку dist/ для загрузки в Releases.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist
mkdir -p dist
for dir in skills/*/; do
  name="$(basename "$dir")"
  (cd skills && zip -rq "../dist/${name}.zip" "$name")
done
echo "Готово: $(ls dist | wc -l) архивов в dist/"

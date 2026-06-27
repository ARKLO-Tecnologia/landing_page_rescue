#!/usr/bin/env bash
set -euo pipefail

# rescue_design_system é repositório privado — pub get precisa de credencial GitHub.
if [ -z "${GITHUB_TOKEN:-}" ]; then
  echo "❌ GITHUB_TOKEN não definido."
  echo "   Netlify → Site configuration → Environment variables"
  echo "   Crie um PAT (classic) com escopo 'repo' e adicione como GITHUB_TOKEN."
  exit 1
fi

git config --global url."https://${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"

flutter pub get
flutter build web --release --no-wasm-dry-run

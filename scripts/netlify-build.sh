#!/bin/bash

# Configura o Git globalmente para usar o Token clássico injetado pela Netlify
if [ -n "$GITHUB_TOKEN" ]; then
  git config --global url."https://${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"
  echo "✅ Credenciais do GitHub aplicadas com sucesso."
else
  echo "❌ Erro: GITHUB_TOKEN não configurado no ambiente da Netlify."
  exit 1
fi

# Executa o build do Flutter
flutter pub get
flutter build web --release

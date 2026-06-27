#!/bin/bash

# Configura o Git globalmente para usar o Token injetado pela Netlify antes de baixar as dependências
if [ -n "$GITHUB_TOKEN" ]; then
  git config --global url."https://${GITHUB_TOKEN}@github.com/".insteadOf "https://github.com/"
  echo "✅ Credenciais do GitHub aplicadas com sucesso."
else
  echo "❌ Erro: GITHUB_TOKEN não configurado no ambiente."
  exit 1
fi

# Executa a limpeza e o build do Flutter
flutter pub get
flutter build web --release

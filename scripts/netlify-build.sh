#!/bin/bash

# Configura o Git para usar o Token Clássico APENAS nos repositórios da ARKLO-Tecnologia
if [ -n "$GITHUB_TOKEN" ]; then
  git config --global url."https://${GITHUB_TOKEN}@github.com/ARKLO-Tecnologia/".insteadOf "https://github.com/ARKLO-Tecnologia/"
  echo "✅ Credenciais do GitHub aplicadas especificamente para ARKLO-Tecnologia."
else
  echo "❌ Erro: GITHUB_TOKEN não configurado no ambiente da Netlify."
  exit 1
fi

# Executa o build do Flutter
flutter pub get
flutter build web --release

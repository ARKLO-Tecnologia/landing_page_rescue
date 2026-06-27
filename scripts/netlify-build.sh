#!/bin/bash

# Configura o Git para usar o Token Clássico APENAS nos repositórios da ARKLO-Tecnologia
if [ -n "$GITHUB_TOKEN" ]; then
  git config --global url."https://${GITHUB_TOKEN}@github.com/ARKLO-Tecnologia/".insteadOf "https://github.com/ARKLO-Tecnologia/"
  echo "✅ Credenciais do GitHub aplicadas especificamente para ARKLO-Tecnologia."
else
  echo "❌ Erro: GITHUB_TOKEN não configurado no ambiente da Netlify."
  exit 1
fi

# Remove artefatos de build antigos que possam estar no repo (forçam layout desatualizado).
rm -f web/main.dart.js web/flutter.js web/flutter_bootstrap.js web/flutter_service_worker.js web/version.json
rm -rf web/assets web/canvaskit

flutter clean
flutter pub get
flutter build web --release

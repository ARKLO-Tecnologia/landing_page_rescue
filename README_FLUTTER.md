# Landing Page de Emergência — Versão Flutter

Este diretório contém uma implementação em **Flutter** da landing page existente neste projeto (originalmente em React/Vite).

## Estrutura principal

- `pubspec.yaml` — configuração do projeto Flutter e dependências.
- `lib/main.dart` — ponto de entrada da aplicação.
- `lib/src/app.dart` — configuração do `MaterialApp` e composição da landing page.
- `lib/src/theme/app_theme.dart` — tema, cores e tipografia base.
- `lib/src/sections/` — widgets que representam cada seção da landing page:
  - `header_section.dart`
  - `hero_section.dart`
  - `problem_section.dart`
  - `solution_section.dart`
  - `features_table_section.dart`
  - `forensic_differential_section.dart`
  - `operation_flow_section.dart`
  - `platform_section.dart`
  - `mobile_section.dart`
  - `cta_section.dart`
  - `footer_section.dart`

## Como rodar

1. Certifique-se de ter o **Flutter SDK** instalado e configurado.
2. No terminal, dentro da pasta do projeto, rode:

   ```bash
   flutter pub get
   flutter run -d chrome
   ```

   ou escolha outro dispositivo disponível com `flutter devices`.

## Observações

- O foco deste código é espelhar a estrutura e o conteúdo da landing page original, adaptando o layout para o ecossistema Flutter.
- Ajustes finos de responsividade e animações podem ser adicionados conforme a necessidade do projeto.


# Rescue Pitchtech — Landing Page (Flutter)

Landing page de marketing do **Rescue**, produto de gestão de emergência médica. Implementada em **Flutter** com foco em **web**, seguindo **DDD + MVVM**.

Design original: [Figma — Landing page design](https://www.figma.com/design/ykJTKTR7DxMC3pHiyhAzhL/Landing-page-design)

---

## Sumário

- [Sobre o projeto](#sobre-o-projeto)
- [Arquitetura](#arquitetura)
- [Estrutura de pastas](#estrutura-de-pastas)
- [Stack tecnológica](#stack-tecnológica)
- [Como rodar](#como-rodar)
- [Testes e qualidade](#testes-e-qualidade)
- [Documentação por camada](#documentação-por-camada)
- [Seções da landing page](#seções-da-landing-page)
- [Configuração e ambiente](#configuração-e-ambiente)
- [Como adicionar uma nova feature](#como-adicionar-uma-nova-feature)

---

## Sobre o projeto

Este repositório contém a landing page institucional do Rescue, convertida de React/Vite para Flutter. O objetivo é apresentar o produto para hospitais e equipes clínicas: problemas que resolve, solução, funcionalidades, diferencial forense, fluxo operacional, plataforma web, app mobile e formulário de contato.

**Package name:** `rescue_pitchtech`

---

## Arquitetura

O projeto combina **DDD** (Domain-Driven Design) com **MVVM** na camada de apresentação:

```
┌──────────────────────────────────────────────────────────────────┐
│  PRESENTATION — View + ViewModel (Flutter, ChangeNotifier)     │
└────────────────────────────┬─────────────────────────────────────┘
                             │ depende de contratos
┌────────────────────────────▼─────────────────────────────────────┐
│  DOMAIN — Entities + Repository interfaces (Dart puro)           │
└────────────────────────────┬─────────────────────────────────────┘
                             │ implementado por
┌────────────────────────────▼─────────────────────────────────────┐
│  DATA — Datasources, DTOs, RepositoryImpl                        │
└──────────────────────────────────────────────────────────────────┘
```

### Princípios SOLID e Clean Code

| Princípio | Como é aplicado |
|-----------|-----------------|
| **S** — Single Responsibility | Cada camada e classe tem um papel claro |
| **O** — Open/Closed | Novos datasources sem alterar domínio |
| **L** — Liskov | `RepositoryImpl` substitui o contrato sem quebrar |
| **I** — Interface Segregation | Contratos enxutos (`LandingPageRepository`) |
| **D** — Dependency Inversion | ViewModel depende de interface, não de Dio |
| Estado imutável | `LandingPageState` com `copyWith` |
| Erros funcionais | `Either<Failure, T>` no repository |

### Fluxo do formulário

```
ContactFormCard (View)
  → LandingPageViewModel.submitDemoRequest()
    → LandingPageRepository (interface)
      → LandingPageRepositoryImpl
        → RemoteDataSource (POST Dio)
        → fallback → LocalDataSource
  ← LandingPageState atualizado
  ← ListenableBuilder rebuilda
```

---

## Estrutura de pastas

```
landing_page_rescue/
├── assets/imagens/
├── lib/
│   ├── main.dart
│   ├── bootstrap.dart
│   ├── app.dart
│   ├── injection_container.dart
│   ├── shared/
│   └── features/landing_page/
│       ├── domain/           # Entities + contratos
│       ├── data/             # Implementação + conteúdo estático
│       ├── presentation/     # ViewModels + Views (MVVM)
│       └── di/
├── test/
├── web/
└── pubspec.yaml
```

---

## Stack tecnológica

| Pacote | Uso |
|--------|-----|
| [GetIt](https://pub.dev/packages/get_it) | Injeção de dependências |
| [dartz](https://pub.dev/packages/dartz) | `Either` para erros |
| [Dio](https://pub.dev/packages/dio) | Cliente HTTP |
| [equatable](https://pub.dev/packages/equatable) | Entidades imutáveis |
| [url_launcher](https://pub.dev/packages/url_launcher) | Links externos |
| [google_fonts](https://pub.dev/packages/google_fonts) | Fonte Inter |
| [rescue_design_system](https://github.com/ARKLO-Tecnologia/rescue_design_system) | Design System Rescue |
| [mocktail](https://pub.dev/packages/mocktail) | Mocks nos testes |

---

## Como rodar

```bash
flutter pub get
flutter run -d chrome
flutter analyze
flutter test
```

Ícones do app (após alterar assets):

```bash
dart run flutter_launcher_icons
```

---

## Testes e qualidade

```
test/
├── features/landing_page/
│   ├── data/
│   │   ├── content/landing_content_data_test.dart
│   │   └── repositories/landing_page_repository_impl_test.dart
│   └── presentation/
│       ├── viewmodels/landing_page_view_model_test.dart
│       └── views/pages/landing_page_test.dart
└── shared/utils/email_validator_test.dart
```

**16 testes** cobrem conteúdo estático, repository (get + submit), ViewModel (init + formulário), widget test e validação de e-mail.

---

## Documentação por camada

| Camada | Caminho |
|--------|---------|
| Shared | [`lib/shared/README.md`](lib/shared/README.md) |
| Feature | [`lib/features/landing_page/README.md`](lib/features/landing_page/README.md) |
| Domain | [`lib/features/landing_page/domain/README.md`](lib/features/landing_page/domain/README.md) |
| Data | [`lib/features/landing_page/data/README.md`](lib/features/landing_page/data/README.md) |
| Presentation | [`lib/features/landing_page/presentation/README.md`](lib/features/landing_page/presentation/README.md) |
| DI | [`lib/features/landing_page/di/README.md`](lib/features/landing_page/di/README.md) |

---

## Seções da landing page

Ordem em `presentation/views/widgets/landing_sections.dart`:

| # | Seção | Descrição |
|---|-------|-----------|
| 1 | Header | Logo, menu mobile, navegação desktop |
| 2 | Hero | Banner principal |
| 3 | Problema | Cards de alerta |
| 4 | Solução | Funcionalidades principais |
| 5 | Funcionalidades | Destaques em cards |
| 6 | Diferencial forense | Rastreabilidade |
| 7 | Fluxo operacional | Etapas do atendimento |
| 8 | Plataforma | Versão web |
| 9 | Mobile | Aplicativo |
| 10 | CTA | Formulário + contato + download |
| 11 | Footer | Copyright, termos, privacidade |

---

## Configuração e ambiente

Constantes em `lib/shared/config/environment.dart`:

| Variável | Descrição |
|----------|-----------|
| `baseUrl` | URL base da API |
| `contactEndpoint` | Endpoint do formulário |
| `contactPhone` / `contactEmail` | Contatos (fonte única → `LandingContentData`) |
| `playStoreUrl` / `appStoreUrl` | Links das lojas |
| `termsUrl` / `privacyUrl` | Termos e privacidade |

---

## Como adicionar uma nova feature

1. Crie `lib/features/nova_feature/` com `domain/`, `data/`, `presentation/`, `di/`.
2. Domain: entities + repository interfaces (Dart puro).
3. Data: implementações e DTOs.
4. Presentation: ViewModels + Views.
5. Registre em `injection_container.dart`.

```dart
import 'package:rescue_pitchtech/features/landing_page/domain/entities/landing_content.dart';
```

---

## Assets

Imagens em `assets/imagens/`:

- `app_icon.png`, `app_icon_foreground.png` — ícone do app
- `medical.png` — hero
- `celular.png` — seção mobile
- Logo na UI via `RescueLogo` do design system

---

## Licença

Projeto privado (`publish_to: "none"`). Versão: **1.0.0+1**.

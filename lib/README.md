# lib/

Ponto de entrada e código compartilhado do app Flutter.

## Bootstrap

```
main.dart → bootstrap.dart → setupDependencies() → runApp(LandingPageApp)
```

| Arquivo | Função |
|---------|--------|
| `main.dart` | Entry point Flutter |
| `bootstrap.dart` | `ensureInitialized` + DI |
| `app.dart` | `MaterialApp` + tema |
| `injection_container.dart` | GetIt global |

## Features

```
features/landing_page/
├── domain/         → Entidades + contratos (DDD)
├── data/           → Implementação de dados
├── presentation/   → MVVM (ViewModels + Views)
└── di/             → Módulo GetIt da feature
```

Ver [features/landing_page/README.md](features/landing_page/README.md).

## Shared

Utilitários, tema, responsividade e widgets genéricos.
Ver [shared/README.md](shared/README.md).

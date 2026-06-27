# DI — Landing Page

Registro de dependências com **GetIt**.

## Registros

| Tipo | Escopo |
|------|--------|
| `Dio` | Singleton |
| `LandingPageLocalDataSource` | Singleton |
| `LandingPageRemoteDataSource` | Singleton |
| `LandingPageRepository` → `LandingPageRepositoryImpl` | Singleton |
| `LandingPageViewModel` | Factory (nova instância por tela) |

ViewModels são **Factory** — nova instância por página. Repositories e Dio são singletons.

## Uso na View

```dart
_viewModel = getIt<LandingPageViewModel>();
_viewModel.init();
```

## Adicionar dependência

1. Registre em `landing_page_injection.dart`.
2. Se for interface de domínio, registre a implementação de `data/`.
3. ViewModels recebem apenas contratos de `domain/` (Dependency Inversion).

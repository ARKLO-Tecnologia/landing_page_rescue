# Feature — Landing Page

Landing page do Rescue organizada em **DDD + MVVM**.

## Camadas

```
domain/          → Entidades e contratos (regras de negócio puras)
data/            → Implementação de dados (API, conteúdo estático, mappers)
presentation/    → ViewModels + Views (UI Flutter)
di/              → Injeção de dependências (GetIt)
```

## Fluxo de dependências (SOLID)

```
presentation  →  domain  ←  data
     ↓
   shared
```

- **Dependency Inversion:** ViewModel depende de `LandingPageRepository` (interface), não da implementação.
- **Single Responsibility:** cada camada tem um papel claro.
- **Open/Closed:** novos datasources podem ser adicionados sem alterar o domínio.

## Fluxo do formulário

```
ContactFormCard (View)
  → LandingPageViewModel.submitDemoRequest()
    → LandingPageRepository
      → RemoteDataSource (POST) → fallback LocalDataSource
  ← LandingPageState atualizado
  ← ListenableBuilder rebuilda
```

## Documentação por camada

| Camada | README |
|--------|--------|
| Domain | [domain/README.md](domain/README.md) |
| Data | [data/README.md](data/README.md) |
| Presentation | [presentation/README.md](presentation/README.md) |
| DI | [di/README.md](di/README.md) |

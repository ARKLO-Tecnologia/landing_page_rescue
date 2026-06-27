# View

Widgets e páginas — camada **View** do MVVM. Apenas UI e interação do usuário.

```
views/
├── pages/           → Telas (LandingPage)
└── widgets/         → Seções, cards, CTA
    ├── cards/
    └── cta/
```

## Regras

- Views **observam** ViewModels via `ListenableBuilder`
- Views **não** chamam repository ou datasource
- Views **não** contêm validação de negócio
- Composição principal em `widgets/landing_sections.dart`

## Como adicionar seção

1. Crie widget em `widgets/minha_secao.dart`
2. Adicione em `landing_sections.dart`
3. Se precisar de estado, passe `viewModel` como parâmetro

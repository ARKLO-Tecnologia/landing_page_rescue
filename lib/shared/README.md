# Shared

Código transversal reutilizado entre features.

## Estrutura

```
shared/
├── config/         → Environment (URLs, contato)
├── errors/         → Failures e Exceptions
├── extensions/     → ResponsiveContext
├── mvvm/           → ViewModel base (ChangeNotifier)
├── navigation/     → Scroll e IDs de seção
├── responsive/     → Breakpoints e display sizes
├── theme/          → AppTheme, AppColors, AppTextStyles
├── utils/          → EmailValidator, UrlLauncherService
└── widgets/        → SectionContainer, ResponsiveSplitLayout, etc.
```

## Relação com camadas

```
presentation  →  shared
data          →  shared
domain        →  (sem shared, exceto failures via repository)
```

## Responsividade

Use `ResponsiveContext` (`context.responsiveValue(...)`) em widgets.
Breakpoints em `responsive/landing_breakpoints.dart`.

## Tema

`AppColors` estende tokens do `rescue_design_system` com cores específicas da landing.
Importe sempre com `hide AppColors` do design system para evitar conflito de nomes.

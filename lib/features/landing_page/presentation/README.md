# Presentation

Camada de apresentação — **MVVM** + **1 widget/classe por arquivo**.

## Estrutura

```
presentation/
├── contracts/
│   ├── landing_page_screen_state.dart
│   └── landing_contact_form_host.dart
├── viewmodels/
│   ├── landing_page_state.dart
│   └── landing_page_view_model.dart
└── views/
    ├── pages/
    │   └── landing_page.dart              # Casca (StatefulWidget)
    └── widgets/
        ├── landing_page/                  # Estado da página
        │   ├── landing_page_state_router.dart
        │   ├── landing_loading_view.dart
        │   ├── landing_error_view.dart
        │   └── landing_content_view.dart
        ├── header/
        │   ├── header_section.dart
        │   ├── header_bar.dart
        │   ├── header_nav_item.dart
        │   └── header_nav_config.dart
        ├── footer/
        │   ├── footer_section.dart
        │   └── footer_link.dart
        ├── cta/
        │   ├── cta_section.dart
        │   ├── cta_section_content.dart
        │   ├── contact_form_card.dart
        │   ├── contact_info_item.dart
        │   ├── phone_contact_item.dart
        │   ├── email_contact_item.dart
        │   ├── store_download_buttons.dart
        │   └── store_download_button.dart
        ├── cards/                           # Cards reutilizáveis
        ├── landing_sections.dart            # Composição das seções
        └── …                                # Seções (hero, problem, etc.)
```

## Regra

- **1 classe pública = 1 arquivo**
- Widget privado (`_Foo`) → extrair para arquivo próprio com nome público
- GetIt **somente** em `landing_page.dart`
- Filhos recebem contratos/callbacks via construtor

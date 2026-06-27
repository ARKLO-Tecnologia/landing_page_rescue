# Domain

Camada de domínio — **Dart puro**, sem dependência de Flutter ou Dio.

## Conteúdo

| Pasta/arquivo | Responsabilidade |
|---------------|------------------|
| `entities/landing_content.dart` | Conteúdo dinâmico (contato + CTA) |
| `entities/contact_request.dart` | Solicitação do formulário |
| `repositories/landing_page_repository.dart` | Contrato de acesso a dados |

## Princípios DDD

- **Entities:** objetos com identidade e dados de negócio (`Equatable`).
- **Repository interface:** abstrai *como* os dados são obtidos — a implementação fica em `data/`.
- **Sem frameworks:** esta camada não importa `flutter`, `dio` ou `get_it`.

## Regra de dependência

```
presentation  →  domain  ←  data
```

Nada em `domain/` importa de `data/` ou `presentation/`.

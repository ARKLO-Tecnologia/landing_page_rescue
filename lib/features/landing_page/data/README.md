# Data

Implementação concreta dos contratos de domínio.

## Conteúdo

| Pasta/arquivo | Responsabilidade |
|---------------|------------------|
| `content/landing_content_data.dart` | Fonte única do conteúdo estático (contato + CTA) |
| `datasources/` | Local (conteúdo + fallback) e remoto (API Dio) |
| `dto/contact_request_dto.dart` | Serialização JSON para API |
| `mappers/contact_request_mapper.dart` | Entity → DTO |
| `repositories/landing_page_repository_impl.dart` | Implementação do contrato de domínio |

## Conteúdo da landing

Textos de marketing (hero, features, etc.) permanecem nas **Views** — são estáticos.

Apenas dados **dinâmicos/configuráveis** passam pelo domínio:

- Telefone e e-mail de contato (`Environment` → `LandingContentData`)
- Título e subtítulo do CTA

## Envio do formulário

1. Tenta POST via `LandingPageRemoteDataSource` (`Environment.baseUrl + contactEndpoint`).
2. Em falha de rede → fallback via `LandingPageLocalDataSource`.
3. Erros convertidos em `Failure` via `Either<Failure, T>`.

## Adicionar novo datasource

1. Crie a interface em `datasources/`.
2. Implemente e registre em `di/landing_page_injection.dart`.
3. Injete no `LandingPageRepositoryImpl` — domínio permanece inalterado (Open/Closed).

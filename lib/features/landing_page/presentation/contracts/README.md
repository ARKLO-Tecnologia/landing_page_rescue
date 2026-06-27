# Contratos da Presentation (DIP)

Interfaces que desacoplam widgets de implementações concretas — facilitam widget tests com mocks.

| Contrato | Consumidores | Implementação |
|----------|--------------|---------------|
| `LandingPageScreenState` | `LandingPageStateRouter` | `LandingPageViewModel` |
| `LandingContactFormHost` | `CtaSection`, `ContactFormCard`, `LandingSections` | `LandingPageViewModel` |

Navegação por âncoras: `LandingSectionAnchorRegistry` em `shared/navigation/`.

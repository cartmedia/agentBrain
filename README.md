# agentBrain

Portable kennisbank voor VS Code Copilot. Plaats deze map in je project root of gebruik `.github/copilot-instructions.md` als entry point.

## Structuur
- `.github/copilot-instructions.md` — Copilot leest dit automatisch
- `Learnings/` — Technische inzichten, patronen, troubleshooting
- `Templates/` — Templates voor nieuwe notes
- `System/` — Regels en configuratie

## Gebruik

### Quick Start
1. Clone of kopieer deze repo in je project
2. Copilot pikt `.github/copilot-instructions.md` automatisch op
3. Verwijs daarin naar relevante bestanden in `Learnings/`

### Hoe het werkt
Copilot leest `.github/copilot-instructions.md` bij elke interactie. Dit bestand verwijst naar patronen en regels in de `Learnings/` en `System/` mappen, zodat Copilot context heeft over je werkwijze en technische beslissingen.

### Uitbreiden
Voeg nieuwe inzichten toe aan `Learnings/` met het template uit `Templates/Learning.md`. Copilot pikt ze automatisch op zodra je ernaar verwijst in `copilot-instructions.md`.

## Compatibiliteit
- **VS Code Copilot** — primaire target (leest `.github/copilot-instructions.md`)
- **Cline / Continue** — ondersteunt MCP, kan direct bestanden lezen
- **Cursor** — leest `.cursorrules` (niet meegeleverd, zelf aanmaken)

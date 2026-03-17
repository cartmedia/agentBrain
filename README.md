# agentBrain

Portable kennisbank voor VS Code Copilot. Plaats deze map in je project root. Als je agentBrain in een subdirectory plaatst, pas dan alle relatieve paden in `.github/copilot-instructions.md` aan.

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
Voeg nieuwe inzichten toe aan `Learnings/` met het template uit `Templates/Learning.md`. Vervang `{{date}}` met de datum (YYYY-MM-DD) en `{{title}}` met je titel. Frontmatter is verplicht:
- **Learning files**: `date`, `type`, `tags`, `confidence`, `source`
- **Project files**: `date`, `type`, `tags`, `status`, `priority`

Copilot pikt ze automatisch op zodra je ernaar verwijst in `copilot-instructions.md`.

### Self-Learning
agentBrain is zelflerend: Copilot schrijft automatisch nieuwe inzichten, patronen en troubleshooting fixes naar de juiste bestanden. Zie `System/Rules.md` voor het volledige protocol.

## Obsidian Vault
agentBrain is ook een Obsidian vault. Open de map in Obsidian voor graph view, backlinks en zoeken. Wiki-links (`[[note-naam]]`) worden gebruikt in Gerelateerd secties. Elke note heeft een UUID5 `id` in frontmatter voor stabiele identificatie.

## Compatibiliteit
- **VS Code Copilot** — primaire target (leest `.github/copilot-instructions.md` + skills)
- **Obsidian** — open als vault voor graph view, backlinks, zoeken
- **Cline / Continue** — ondersteunt MCP, kan direct bestanden lezen
- **Cursor** — leest `.cursorrules` (niet meegeleverd, zelf aanmaken)

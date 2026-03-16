# Copilot Brain

Lightweight kennisbank voor gebruik met VS Code Copilot.
Plaats deze map in je project root als `brain/` of gebruik `.github/copilot-instructions.md` als entry point.

## Structuur
- `Learnings/` — Technische inzichten, patronen, troubleshooting
- `Projects/` — Actieve projecten en context
- `Templates/` — Templates voor nieuwe notes
- `System/` — Regels en configuratie

## Gebruik met Copilot
Copilot leest automatisch `.github/copilot-instructions.md`.
Verwijs daarin naar relevante brain-bestanden zodat Copilot ze meeneemt.

## Gebruik met andere tools
- **Cline/Continue**: Ondersteunt MCP — kan direct bestanden lezen
- **Claude Code**: Gebruik ClaudeBrain (~/ClaudeBrain/) in plaats hiervan

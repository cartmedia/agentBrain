# agentBrain — Copilot Instructions

## Wat is agentBrain?
agentBrain is een persistent extern geheugen. Het groeit mee met elke sessie.
Copilot's interne memories vervallen na 28 dagen — agentBrain is permanent.

## Kennisbank
Raadpleeg deze bij elke sessie:
- Bekende patronen: `Learnings/Patterns.md`
- Troubleshooting: `Learnings/Troubleshooting.md`
- Projectcontext: `Projects/`
- Regels & self-learning: `System/Rules.md`

## Stijl
- Nederlands voor communicatie, technische termen in het Engels OK
- Kort en bondig — geen overbodige uitleg
- Minimalistisch: eenvoudigste oplossing die werkt wint altijd
- Geen over-engineering, geen features "voor het geval dat"

## Code Conventions
- Clean code, geen bloat
- Functie boven vorm
- Iteratief: eerst werkend, dan mooi, dan geoptimaliseerd
- Bij twijfel: vraag

## Self-Learning (VERPLICHT)

agentBrain leert actief mee. Na elke sessie waarin je iets nieuws ontdekt, **schrijf het op**.

### Triggers — wanneer schrijven
| Trigger | Actie |
|---------|-------|
| Workaround gevonden | → `Learnings/Troubleshooting.md` |
| Patroon 2x+ gezien | → `Learnings/Patterns.md` |
| Nieuw technisch inzicht | → `Learnings/[categorie].md` (nieuw bestand) |
| Nieuw project gestart | → `Projects/[naam].md` (template: `Templates/Project.md`) |
| Project milestone/beslissing | → bestaande `Projects/[naam].md` bijwerken |
| Library/API beperking ontdekt | → `Learnings/Troubleshooting.md` |
| Cross-platform fix | → `Learnings/Troubleshooting.md` |
| Build/deploy configuratie | → `Learnings/[tool].md` of `Troubleshooting.md` |

### Format
Gebruik altijd frontmatter:
```yaml
---
date: YYYY-MM-DD
type: learning
tags: [relevante, tags]
confidence: high/medium/low
source: session
---
```

### Regels
- **Update > nieuw** — bestaande notes bijwerken boven nieuwe maken
- **Kort en bondig** — geen proza, alleen actionable info
- **Bewijs vereist** — geen speculatie, alleen bevestigde feiten
- **Patronen: minimaal 2x voorgekomen** voordat het een patroon is
- **Troubleshooting: reproduceerbaar** — probleem + oplossing + context

### Wat NIET schrijven
- Triviale/eenmalige info
- Info die al in een note staat
- Sessie-specifieke tijdelijke state
- Speculatie zonder bewijs

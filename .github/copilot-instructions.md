---
date: 2026-03-16
type: system
tags: [meta, copilot-config, entry-point]
---

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
- Zie `System/Rules.md` voor gedetailleerde prioriteiten en werkstijl

## Self-Learning (VERPLICHT)

agentBrain leert actief mee. Na elke sessie waarin je iets nieuws ontdekt, **schrijf het op**.

### Triggers — wanneer schrijven
| Trigger | Actie |
|---------|-------|
| Workaround/fix gevonden | → `Learnings/Troubleshooting.md` — sectie toevoegen |
| Patroon 2x+ herkend | → `Learnings/Patterns.md` — sectie toevoegen |
| Patroon 1e keer gezien | → `Learnings/Patterns.md` met `confidence: low`, noteer "gezien 1x" |
| Nieuw technisch inzicht | → `Learnings/[categorie].md` — nieuw bestand (PascalCase, bv. `macOS.md`) |
| Nieuw project gestart | → `Projects/[naam].md` — gebruik `Templates/Project.md` |
| Project milestone/beslissing | → bestaande `Projects/[naam].md` bijwerken |
| Library/API beperking ontdekt | → `Learnings/Troubleshooting.md` — sectie toevoegen |
| Cross-platform fix | → `Learnings/Troubleshooting.md` — sectie toevoegen |
| Build/deploy configuratie | → `Learnings/[tool].md` of `Troubleshooting.md` |

### Format
Gebruik altijd frontmatter. Per bestandstype:

**Learning files** (`Learnings/*.md`):
```yaml
---
date: YYYY-MM-DD
type: learning
tags: [relevante, tags]
confidence: high/medium/low
source: session
---
```

**Project files** (`Projects/*.md`):
```yaml
---
date: YYYY-MM-DD
type: project
tags: [relevante, tags]
status: active/paused/done
priority: high/medium/low
---
```

### Regels
- **Update > nieuw** — bestaande notes bijwerken boven nieuwe maken
- **Kort en bondig** — geen proza, alleen actionable info
- **Bewijs vereist** — geen speculatie, alleen bevestigde feiten
- **Patronen: minimaal 2x voorgekomen** voordat het een confirmed patroon is (1e keer: `confidence: low`)
- **Troubleshooting: reproduceerbaar** — probleem + oplossing + context

### Wat NIET schrijven
- Triviale/eenmalige info
- Info die al in een note staat
- Sessie-specifieke tijdelijke state
- Speculatie zonder bewijs

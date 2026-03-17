---
date: 2026-03-16
type: system
tags: [meta, rules]
id: d677f5c9-ec8c-57fa-86cf-5ec8b42b883f
---

# agentBrain Regels

## Kernprincipe
Dit is een extern geheugen. Het groeit mee met elke sessie en wordt slimmer over tijd.
`System/Rules.md` is het gedetailleerde beleid. `.github/copilot-instructions.md` is de uitvoeringsspec die Copilot automatisch leest.

## Werkstijl
- Autonome uitvoering — taken afmaken zonder te vragen bij triviale beslissingen
- Alleen storen bij echte blokkades
- Liever een ding goed dan drie dingen half
- Iteratief: eerst werkend, dan mooi, dan geoptimaliseerd

## Prioriteiten
1. Werkt het? (functionaliteit)
2. Is het begrijpelijk? (leesbaarheid)
3. Is het onderhoudbaar? (structuur)
4. Is het mooi? (design)

## Self-Learning Protocol

agentBrain is een zelflerend systeem. Copilot's interne memories vervallen na 28 dagen.
Alles wat waardevol is MOET hier permanent opgeslagen worden.

### Stap 1: Lezen bij sessie-start
Lees bij het begin van elke sessie:
1. `Learnings/Patterns.md` — bekende patronen
2. `Learnings/Troubleshooting.md` — bekende problemen
3. Relevante `Projects/*.md` — projectcontext

### Stap 2: Schrijven tijdens sessie
| Trigger | Actie |
|---------|-------|
| Workaround/fix gevonden | → `Learnings/Troubleshooting.md` — sectie toevoegen |
| Patroon 2x+ herkend | → `Learnings/Patterns.md` — sectie toevoegen |
| Patroon 1e keer gezien | → `Learnings/Patterns.md` met `confidence: low`, noteer "gezien 1x" |
| Nieuw technisch inzicht | → `Learnings/[categorie].md` — nieuw bestand (zie categorieën hieronder) |
| Nieuw project gestart | → `Projects/[naam].md` — gebruik `Templates/Project.md` |
| Project milestone/beslissing | → bestaande `Projects/[naam].md` bijwerken |
| Library/API beperking ontdekt | → `Learnings/Troubleshooting.md` — sectie toevoegen |
| Cross-platform fix | → `Learnings/Troubleshooting.md` — sectie toevoegen |
| Build/deploy configuratie | → `Learnings/[tool].md` of `Troubleshooting.md` |

### Categorieën voor `Learnings/[categorie].md`
Voorbeelden van categorie-bestanden die je kunt aanmaken:
- `Learnings/macOS.md` — platform-specifieke kennis
- `Learnings/Node.md` — Node.js/npm/Bun specifiek
- `Learnings/Git.md` — geavanceerde git workflows
- `Learnings/Docker.md` — containers, compose, deploy
- `Learnings/CSS.md` — styling, layout, animaties
- `Learnings/Swift.md` — iOS/macOS development

Naamconventie: PascalCase, kort, technologie-georiënteerd.
Maak ze pas aan wanneer een relevant inzicht opduikt — niet preventief.

### Stap 3: Valideren
Voordat je schrijft, check:
- [ ] Staat dit er al? → dan UPDATE, niet nieuw
- [ ] Is het actionable? → zo niet, niet opslaan
- [ ] Is het bewezen? → geen speculatie
- [ ] Is het reproduceerbaar? (bij troubleshooting)

## Wanneer NIET schrijven
- Triviale/eenmalige info
- Info die al in een note staat
- Speculatie zonder bewijs
- Sessie-specifieke tijdelijke state

## Hoe schrijven
- Frontmatter altijd verplicht. Per type:
  - **Learning**: `date`, `type`, `tags`, `confidence`, `source`, `id` — tracking inzichten uit sessies/docs
  - **Project**: `date`, `type`, `tags`, `status`, `priority`, `id` — tracking entiteiten, niet inzichten (daarom geen `confidence`/`source`)
- **`id`**: UUID5 hash, namespace `a3b2c1d0-1234-5678-9abc-def012345678` + `agentBrain/[pad]` (zonder extensie)
- **Wiki-links**: gebruik `[[note-naam]]` in Gerelateerd secties (voor Obsidian graph view)
- Kort en bondig, geen proza
- Update > nieuw — bestaande notes bijwerken boven nieuwe maken
- Elke note moet actionable zijn
- `source: session` voor inzichten uit chat, `source: documentation` voor docs

## Kwaliteit
- Patronen: minimaal 2x voorgekomen voor `confidence: high` (1e keer: schrijf met `confidence: low`, noteer "gezien 1x")
- Patroon blijkt fout? → update `confidence: retracted` en voeg toe waarom het niet klopt
- Troubleshooting: reproduceerbaar
- Verouderde info: updaten of verwijderen
- Staleness check: bij tool/library updates, review notes voor die tool. Notes ouder dan 6 maanden zonder updates verdienen een check
- Project-inzicht wordt algemeen patroon? → verplaats naar [[Patterns]], laat cross-ref achter in project note

## Voorbeeld: Troubleshooting entry
```markdown
## [Platform/Tool] — [Korte beschrijving]
- **Probleem**: wat ging er mis
- **Oorzaak**: waarom
- **Oplossing**: exacte fix
- **Context**: wanneer dit voorkomt
```

## Voorbeeld: Pattern entry
```markdown
## [Categorie]
- Patroon beschrijving — waarom het werkt
- Anti-patroon — waarom het niet werkt
```

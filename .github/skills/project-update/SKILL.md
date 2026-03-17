---
name: project-update
description: Maak een nieuwe project note aan of werk een bestaande bij in agentBrain. Gebruik bij een nieuw project, milestone, architectuurbeslissing, of statuswijziging.
argument-hint: Projectnaam en wat je wilt vastleggen
---

# Project Update

Maak of werk een project note bij in `Projects/`.

## Stappen

### Nieuw project
1. **Check of het project al bestaat** in `Projects/`
2. **Maak `Projects/[naam].md` aan** met dit frontmatter:
   ```yaml
   ---
   date: YYYY-MM-DD
   type: project
   tags: [relevante, tags]
   status: active/paused/done
   priority: high/medium/low
   ---
   ```
3. **Vul de secties in** volgens de template:
   - `## Doel` — wat doet dit project en waarom
   - `## Setup` — tech stack, repo locatie, belangrijke commando's
   - `## Voortgang` — milestones met datums
   - `## Issues & Oplossingen` — bekende problemen en fixes
   - `## Gerelateerd` — links naar learnings, andere projects

### Bestaand project bijwerken
1. **Lees de bestaande note** in `Projects/[naam].md`
2. **Werk de relevante sectie bij:**
   - Nieuwe milestone → voeg toe aan `## Voortgang` met datum
   - Architectuurbeslissing → voeg toe aan `## Issues & Oplossingen`
   - Status veranderd → update `status` in frontmatter
   - Project afgerond → zet `status: done`
3. **Update de `date` in frontmatter** naar vandaag

### Project-inzicht wordt algemeen patroon?
Als een project-specifiek inzicht breder toepasbaar is:
1. Verplaats het naar `Learnings/Patterns.md`
2. Laat een cross-reference achter in de project note

## Referenties
- Template: `Templates/Project.md`
- Voorbeeld: `Projects/_voorbeeld.md`
- Regels: `System/Rules.md`

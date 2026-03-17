---
name: brain-review
description: Review agentBrain op verouderde notes, ontbrekende info, en kwaliteit. Gebruik periodiek (maandelijks) of wanneer de kennisbank onderhoud nodig heeft.
argument-hint: Optioneel focus-gebied (bv. "Learnings" of "Projects")
---

# Brain Review

Periodieke review van agentBrain om de kennisbank gezond te houden.

## Stappen

1. **Inventariseer alle files:**
   - Lees alle bestanden in `Learnings/` en `Projects/`
   - Noteer het aantal files, laatste update-datums, en confidence levels

2. **Check staleness:**
   - Notes ouder dan 6 maanden zonder updates → markeer voor review
   - Technologie-gerelateerde notes → check of de tool/library versie nog actueel is
   - `confidence: low` entries → zijn ze inmiddels 2x+ bevestigd? Update naar `high`

3. **Check kwaliteit per note:**
   - Heeft het frontmatter met alle verplichte velden?
     - Learning: `date`, `type`, `tags`, `confidence`, `source`
     - Project: `date`, `type`, `tags`, `status`, `priority`
   - Is het actionable? (niet alleen "interessant")
   - Is het kort en bondig? (geen overbodige tekst)
   - Heeft het een `## Gerelateerd` sectie met relevante links?

4. **Check patronen:**
   - Staan er entries in `Troubleshooting.md` die eigenlijk patronen zijn? → verplaats naar `Patterns.md`
   - Zijn er `confidence: retracted` entries die verwijderd kunnen worden?
   - Zijn er dubbele entries?

5. **Check projecten:**
   - Zijn `status: active` projecten nog actief?
   - Zijn afgeronde projecten op `status: done` gezet?
   - Missen er projecten die wel bestaan maar geen note hebben?

6. **Rapporteer:**
   - Aantal notes per categorie
   - Verouderde notes (ouder dan 6 maanden)
   - Ontbrekende frontmatter
   - Aanbevelingen voor opschoning
   - Eventuele fixes direct doorvoeren met bevestiging

## Referenties
- Regels: `System/Rules.md`
- Patronen: `Learnings/Patterns.md`
- Troubleshooting: `Learnings/Troubleshooting.md`

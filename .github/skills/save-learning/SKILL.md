---
name: save-learning
description: Sla een nieuw technisch inzicht op in agentBrain. Gebruik wanneer je een patroon, workaround, of technisch feit ontdekt dat waardevol is voor toekomstige sessies.
argument-hint: Beschrijf het inzicht dat je wilt opslaan
---

# Save Learning

Sla een nieuw inzicht op in agentBrain zodat het permanent beschikbaar blijft.

## Stappen

1. **Bepaal het type inzicht:**
   - Terugkerend patroon (2x+ gezien) → voeg toe aan `Learnings/Patterns.md`
   - Patroon 1e keer gezien → voeg toe aan `Learnings/Patterns.md` met `confidence: low`, noteer "gezien 1x"
   - Nieuw technisch inzicht → maak `Learnings/[Categorie].md` aan (PascalCase, bv. `macOS.md`, `Node.md`)

2. **Check of het al bestaat:**
   - Lees de relevante file
   - Als het inzicht er al staat → UPDATE de bestaande entry
   - Als het nieuw is → voeg een nieuwe sectie toe

3. **Schrijf met het juiste format:**
   - Bestaand bestand bijwerken: voeg een `## Sectie` toe
   - Nieuw bestand aanmaken: gebruik dit frontmatter:
     ```yaml
     ---
     date: YYYY-MM-DD
     type: learning
     tags: [relevante, tags]
     confidence: high/medium/low/retracted
     source: session/documentation
     ---
     ```

4. **Valideer:**
   - Is het actionable? (niet alleen "interessant")
   - Is het bewezen? (geen speculatie)
   - Is het kort en bondig? (geen proza)

5. **Bevestig aan de gebruiker** wat je hebt opgeslagen en waar.

## Referenties
- Template: `Templates/Learning.md`
- Bestaande patronen: `Learnings/Patterns.md`
- Regels: `System/Rules.md`

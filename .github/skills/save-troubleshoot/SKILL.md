---
name: save-troubleshoot
description: Log een probleem en oplossing in agentBrain Troubleshooting. Gebruik wanneer je een bug fixt, een workaround vindt, of een cross-platform issue oplost.
argument-hint: Beschrijf het probleem en de oplossing
---

# Save Troubleshoot

Log een probleem + oplossing in `Learnings/Troubleshooting.md` zodat het niet opnieuw onderzocht hoeft te worden.

## Stappen

1. **Lees `Learnings/Troubleshooting.md`** om de huidige structuur te begrijpen.

2. **Bepaal de sectie:**
   - Bestaande sectie (bv. `## macOS`, `## Node.js`, `## Git`) → voeg entry toe
   - Nieuwe categorie nodig → maak een nieuwe `## Sectie` aan

3. **Schrijf de entry in dit format:**
   ```markdown
   ## [Platform/Tool] — [Korte beschrijving]
   - **Probleem**: wat ging er mis
   - **Oorzaak**: waarom het gebeurde
   - **Oplossing**: exacte fix (met code als relevant)
   - **Context**: wanneer dit voorkomt
   ```

4. **Als het een library/API beperking is**, vermeld:
   - Welke versie van de library/API
   - Of er een upstream fix verwacht wordt
   - Workaround met codevoorbeeld

5. **Valideer:**
   - Is het reproduceerbaar?
   - Is de oplossing getest en bevestigd?
   - Staat het er niet al?

6. **Bevestig aan de gebruiker** wat je hebt gelogd.

## Referenties
- Troubleshooting log: `Learnings/Troubleshooting.md`
- Regels: `System/Rules.md`

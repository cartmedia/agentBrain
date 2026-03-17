---
date: 2026-03-17
type: user-preference
tags: [preferences, besluitvorming, filosofie]
id: 2e5a8c1f-6d3b-5a7e-4f9c-8b0d2e4a6c3f
---

# Besluitvorming

## Kernprincipe
Minimalistisch en pragmatisch. Geen over-engineering, geen bloat.

## Code
- Geen overbodige abstracties — pas abstraheren als het nodig is
- Clean en minimaal
- Bewezen libraries boven zelf bouwen
- Simpelste oplossing die werkt, dan itereren

## Architectuur
- Peer-to-peer boven client-server waar mogelijk
- Direct distributie boven platform stores
- Framework-agnostisch waar mogelijk

## Prioritering
- Werkend > perfect
- Core functionaliteit eerst, nice-to-haves later
- Iteratief: eerst werkend, dan mooi, dan geoptimaliseerd

## Veiligheid
- Production changes: blast radius, reversibiliteit, escape hatch checken
- Validatie-eerst: test formaat voor wijziging

## Anti-patterns (vermijden)
- Over-enthousiaste refactoring zonder reden
- Abstracties toevoegen "voor later"
- Dependencies toevoegen voor triviale functionaliteit
- Premature optimization

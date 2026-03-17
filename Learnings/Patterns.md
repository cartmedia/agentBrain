---
date: 2026-03-16
type: learning
tags: [meta, patterns]
confidence: high
source: session
id: 3e7b2475-b294-5c69-9273-e6cae31ca5f3
---

# Terugkerende Patronen

## Code Stijl
- Minimalistisch: geen abstractions voor eenmalig gebruik
- Drie vergelijkbare regels code is beter dan een premature abstractie
- Alleen validatie op systeemgrenzen (user input, externe APIs)
- Geen error handling voor scenario's die niet kunnen voorkomen

## Git
- Commits: beschrijvend, focus op "waarom" niet "wat"
- Nooit credentials of .env bestanden committen
- Feature branches voor niet-triviale wijzigingen

## Frontend
- Dark/light mode is standaard, geen nagedachte
- Responsive design mobile-first
- Geen emojis in UI, gebruik SVG icons
- BEM naming convention voor CSS componenten

## Backend
- Config via environment variables, nooit hardcoded
- Logging op juiste niveaus (error/warn/info/debug)
- Idempotente operaties waar mogelijk

## Gerelateerd
- [[Troubleshooting]] — anti-patronen en bekende valkuilen
- [[Rules]] — wanneer en hoe patronen opslaan

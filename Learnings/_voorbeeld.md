---
date: 2026-03-17
type: learning
tags: [git, authentication]
confidence: high
source: session
---

# Git GITHUB_TOKEN conflict

## Inzicht
Als `GITHUB_TOKEN` in de shell environment staat maar ongeldig is, faalt `git push` met "Authentication failed". Oplossing: `unset GITHUB_TOKEN` zodat git terugvalt op keyring credentials.

## Context
Komt voor wanneer een CI/CD tool of andere app een GITHUB_TOKEN heeft gezet die verlopen of ongeldig is.

## Bewijs
Meerdere sessies bevestigd (maart 2026). Fix: `GITHUB_TOKEN="" git push` of `unset GITHUB_TOKEN`.

## Gerelateerd
- `Learnings/Troubleshooting.md` — Git sectie
- `Learnings/Patterns.md` — Git patronen

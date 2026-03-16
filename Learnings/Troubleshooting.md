---
date: 2026-03-16
type: learning
tags: [troubleshooting, debugging]
confidence: high
source: session
---

# Troubleshooting Log

## macOS
- `Write` tool kan CRLF line endings toevoegen → check met `file script.sh`, fix met `perl -pi -e 's/\r$//'`
- macOS native rsync is oud (2.6.9) → gebruik Homebrew versie als beschikbaar

## Node.js
- nvm in non-interactive shells: `.bashrc`/`.zshrc` wordt niet geladen → `source "$HOME/.nvm/nvm.sh"` expliciet laden
- `npm install` traag: check disk I/O, probeer `--prefer-offline`

## Git
- Pre-commit hook faalt: fix het probleem, maak NIEUWE commit (niet --amend, dat wijzigt vorige commit)
- Authentication fails met GITHUB_TOKEN: `unset GITHUB_TOKEN` en gebruik keyring credentials

## Gerelateerd
- `Learnings/Patterns.md` — bevestigde patronen en best practices
- `System/Rules.md` — wanneer en hoe troubleshooting opslaan

---
date: 2026-03-17
type: learning
tags: [git, authentication]
confidence: high
source: session
id: fcdff10c-d633-5a25-a427-0030d4d20361
---

# Git GITHUB_TOKEN conflict

## Insight
When `GITHUB_TOKEN` is set in the shell environment but is invalid, `git push` fails with "Authentication failed". Solution: `unset GITHUB_TOKEN` so git falls back to keyring credentials.

## Context
Occurs when a CI/CD tool or other application has set a GITHUB_TOKEN that is expired or invalid.

## Evidence
Confirmed across multiple sessions (March 2026). Fix: `GITHUB_TOKEN="" git push` or `unset GITHUB_TOKEN`.

## Related
- [[Troubleshooting]] — Git section
- [[Patterns]] — Git patterns

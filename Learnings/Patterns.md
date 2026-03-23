---
date: 2026-03-16
type: learning
tags: [meta, patterns]
confidence: high
source: session
id: 3e7b2475-b294-5c69-9273-e6cae31ca5f3
---

# Recurring Patterns

## Code Style
- Minimalist: no abstractions for one-time use
- Three similar lines of code is better than a premature abstraction
- Only validate at system boundaries (user input, external APIs)
- No error handling for scenarios that cannot occur

## Git
- Commits: descriptive, focus on "why" not "what"
- Never commit credentials or .env files
- Feature branches for non-trivial changes

## Frontend
- Dark/light mode is standard, not an afterthought
- Responsive design mobile-first
- No emojis in UI, use SVG icons
- BEM naming convention for CSS components

## Backend
- Config via environment variables, never hardcoded
- Logging at appropriate levels (error/warn/info/debug)
- Idempotent operations where possible

## Related
- [[Troubleshooting]] — anti-patterns and known pitfalls
- [[Rules]] — when and how to save patterns

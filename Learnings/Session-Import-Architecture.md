---
date: 2026-03-23
type: learning
tags: [meta, architecture, sessions, import]
confidence: high
source: session
id: b2c3d4e5-6789-5bcd-ef01-234567890bcd
---

# Session Import Architecture

## Insight
AI coding sessions (stored as .jsonl files) can be parsed and imported into the brain vault for searchability and cross-referencing.

## Architecture
```
Sessions/
├── index.md                     <- master table with all projects + UUIDs
├── <project-slug>/
│   ├── _project.md              <- UUID5, path, session links (MOC pattern)
│   └── <date>-<topic>.md        <- individual session
```

## Key Design Decisions
- **MOC (Map of Content) pattern**: `_project.md` serves as a hub note linking all sessions for that project
- **Wiki-links**: sessions link back via `[[_project]]` in frontmatter — Obsidian backlinks create an associative memory
- **Fuzzy project matching**: match session working directories to brain project folders via substring matching
- **Idempotent imports**: UUID5 ensures re-running import never creates duplicates

## Session Note Structure
Each imported session note contains:
- Date and duration
- Tools used
- Files touched
- Key decisions made
- Links to related project notes

## Related
- [[UUID5-Strategy]] — deterministic identification
- [[Patterns]] — architecture patterns

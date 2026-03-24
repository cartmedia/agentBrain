---
date: 2026-03-16
type: system
tags: [meta, copilot-config, entry-point]
id: fa302a57-d7cd-5211-bed8-ebaa80df1fe3
---

# agentBrain -- Copilot Instructions

## What is agentBrain?
agentBrain is a persistent external memory. It grows with every session.
Copilot's internal memories expire after 28 days -- agentBrain is permanent.

## Session Start
At the start of every session:
1. Read: `Learnings/Patterns.md`, `Learnings/Troubleshooting.md`, `System/Rules.md`, `System/Skills.md`, `System/Lifecycle.md`
2. Read relevant `Projects/[name]/index.md` and `User Preferences/` files
3. **Onboarding check**: If any `User Preferences/` file still contains `This is an example file`, tell the user: "Some preferences are not set up yet. Run `/onboard` to personalize agentBrain."

## Style
- Concise -- no unnecessary explanations
- Minimalist: the simplest solution that works always wins
- No over-engineering, no features "just in case"

## Code Conventions
- Clean code, no bloat
- Function over form
- Iterative: first make it work, then make it clean, then optimize
- When in doubt: ask
- See `System/Rules.md` for detailed priorities and work style

## Self-Learning (REQUIRED)

agentBrain actively learns. When you find a workaround, recognize a pattern, or discover a technical insight, **write it to the appropriate file**. This is an explicit action -- do it at the end of the session or when the insight occurs.

### Triggers -- when to write
| Trigger | Action |
|---------|--------|
| Workaround/fix found | -> `Learnings/Troubleshooting.md` -- add section |
| Pattern recognized 2x+ | -> `Learnings/Patterns.md` -- add section |
| Pattern seen 1st time | -> `Learnings/Patterns.md` with `confidence: low`, note "seen 1x" |
| New technical insight | -> `Learnings/[category].md` -- new file (PascalCase, e.g. `macOS.md`) |
| New project started | -> `Projects/[name]/index.md` -- use `Templates/Project-Index.md` |
| Project milestone/decision | -> existing `Projects/[name]/` update relevant file |
| Library/API limitation discovered | -> `Learnings/Troubleshooting.md` -- add section |
| Cross-platform fix | -> `Learnings/Troubleshooting.md` -- add section |
| Build/deploy configuration | -> `Learnings/[tool].md` or `Troubleshooting.md` |

### Project subfolder structure
Projects use subfolders: `Projects/[name]/` with these files:
- `index.md` (required) -- main project note
- `prd.md` (optional) -- requirements and user stories
- `decisions.md` (optional) -- architecture decision records
- `deploy.md` (optional) -- deploy configuration
- `changelog.md` (optional) -- change log
- `context.md` (optional) -- what to read per phase

Always update `Projects/INDEX.md` when creating or modifying projects.

### Categories for new learning files
Create `Learnings/[Category].md` only when a relevant insight comes up. Examples:
`macOS.md`, `Node.md`, `Git.md`, `Docker.md`, `CSS.md`, `Swift.md`
Naming convention: PascalCase, short, technology-oriented.

### Format
Always use frontmatter. Per file type:

**Learning files** (`Learnings/*.md`):
```yaml
---
date: YYYY-MM-DD
type: learning
tags: [relevant, tags]
confidence: high/medium/low/retracted
source: session/documentation
id: <UUID5>
---
```
- `confidence: retracted` = pattern turned out to be wrong, note why
- `source: session` = from chat, `source: documentation` = from docs

**Project files** (`Projects/[name]/index.md`):
```yaml
---
date: YYYY-MM-DD
type: project
tags: [relevant, tags]
status: active/paused/done
priority: high/medium/low
id: <UUID5>
---
```
Projects track entities, not insights -- hence no `confidence`/`source`.

**UUID5 generation**: namespace `a3b2c1d0-1234-5678-9abc-def012345678` + `agentBrain/[path without extension]`.
**Wiki-links**: use `[[note-name]]` in Related sections for Obsidian graph view.

**System files** (`System/*.md`):
`type: system` -- only for configuration/rules. Do not create these yourself.

### Rules
- **Update > new** -- update existing notes rather than creating new ones
- **Concise** -- no prose, only actionable info
- **Evidence required** -- no speculation, only confirmed facts
- **Patterns: seen at least 2x** before it becomes a confirmed pattern (1st time: `confidence: low`)
- **Troubleshooting: reproducible** -- problem + solution + context

### What NOT to write
- Trivial/one-off information
- Information already in a note
- Session-specific temporary state
- Speculation without evidence

## Skills
agentBrain includes skills you can invoke via `/`:
- `/save-learning` -- save a new insight to the appropriate Learnings file
- `/save-troubleshoot` -- log a problem + solution in Troubleshooting
- `/project-update` -- create or update a project (subfolder structure)
- `/brain-review` -- review agentBrain for outdated or incomplete notes
- `/onboard` -- interactive setup to personalize User Preferences

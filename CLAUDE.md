# agentBrain

Persistent knowledge base -- read at session start, write during session.

## Read these first
- `Learnings/Patterns.md` -- confirmed patterns
- `Learnings/Troubleshooting.md` -- known issues
- `System/Rules.md` -- self-learning protocol and quality rules

## Self-learning (REQUIRED)
When you discover insights, write them:
| Trigger | Action |
|---------|--------|
| Workaround/fix | -> `Learnings/Troubleshooting.md` |
| Pattern (2x+) | -> `Learnings/Patterns.md` |
| New insight | -> `Learnings/[Category].md` (PascalCase) |
| Project milestone | -> `Projects/[name].md` |

## Rules
- Update existing notes over creating new ones
- Evidence required -- no speculation
- Frontmatter required on all notes (see `System/Rules.md`)
- UUID5 IDs: run `scripts/uuid5-gen.sh "path/to/note"`

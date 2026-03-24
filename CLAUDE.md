# agentBrain

Persistent knowledge base -- read at session start, write during session.

## Session start
1. Read: `Learnings/Patterns.md`, `Learnings/Troubleshooting.md`, `System/Rules.md`, `System/Skills.md`, `System/Lifecycle.md`
2. Read relevant `Projects/` and `User Preferences/` files
3. **Onboarding check**: If any `User Preferences/` file contains "This is an example file", tell the user: "Some preferences are not set up yet. Want me to ask you a few questions to personalize agentBrain?"

## Self-learning (REQUIRED)
When you discover insights, write them:
| Trigger | Action |
|---------|--------|
| Workaround/fix | -> `Learnings/Troubleshooting.md` |
| Pattern (2x+) | -> `Learnings/Patterns.md` |
| New insight | -> `Learnings/[Category].md` (PascalCase) |
| Project milestone | -> `Projects/[name]/index.md` |
| Phase transition | -> update `phase:` in frontmatter + log in `changelog.md` |

## Rules
- Update existing notes over creating new ones
- Evidence required -- no speculation
- Frontmatter required on all notes (see `System/Rules.md`)
- UUID5 IDs: run `scripts/uuid5-gen.sh "path/to/note"`

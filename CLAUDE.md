# agentBrain

Persistent knowledge base -- read at session start, write during session.

## Session start
1. Read: `Learnings/Patterns.md`, `Learnings/Troubleshooting.md`, `System/Rules.md`, `System/Skills.md`, `System/Lifecycle.md`
2. Read relevant `Projects/` and `User Preferences/` files
3. Read `local/memories/` for personal context (if exists)
4. **Onboarding check**: If any `User Preferences/` file contains "This is an example file", tell the user: "Some preferences are not set up yet. Want me to ask you a few questions to personalize agentBrain?"

## Where to write

### Shared knowledge (committed to git, visible to everyone)
| Trigger | Destination |
|---------|-------------|
| Workaround/fix | -> `Learnings/Troubleshooting.md` |
| Pattern (2x+) | -> `Learnings/Patterns.md` |
| New insight | -> `Learnings/[Category].md` (PascalCase) |

### Personal data (gitignored, stays local)
| Trigger | Destination |
|---------|-------------|
| Project milestone | -> `local/Projects/[name]/index.md` |
| Phase transition | -> update `phase:` in frontmatter + log in `changelog.md` |
| Session memory | -> `local/memories/` |
| Bot/loop config | -> `local/integrations/` |

## Rules
- Update existing notes over creating new ones
- Evidence required -- no speculation
- Frontmatter required on all notes (see `System/Rules.md`)
- UUID5 IDs: run `scripts/uuid5-gen.sh "path/to/note"`
- **Shared vs personal**: generic learnings go in `Learnings/`, personal context goes in `local/`

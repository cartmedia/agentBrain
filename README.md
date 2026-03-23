# agentBrain v1.0
> Version: v1.0 (2026-03-23)

Portable, self-learning knowledge base for AI coding agents. Works with VS Code Copilot, Obsidian, Cursor, Cline, Claude Code, and any agent that reads markdown.

## Quick Start

1. Clone into your project root:
   ```bash
   git clone https://github.com/your-org/agentBrain.git
   ```
2. Run setup:
   ```bash
   ./scripts/setup.sh
   ```
3. Customize `User Preferences/` with your info
4. Open in your editor -- the agent picks up context automatically

## How It Works

agentBrain is an external memory that grows with every coding session. AI agents' internal memories expire (Copilot: 28 days, Claude: per session). agentBrain is permanent.

The self-learning protocol writes insights, patterns, and troubleshooting fixes to structured files. Your agent reads these at session start and writes new knowledge during sessions.

## Structure

| Folder | Purpose |
|--------|---------|
| `.github/copilot-instructions.md` | Entry point -- agent reads this automatically |
| `.github/skills/` | Slash commands (`/save-learning`, `/brain-review`, etc.) |
| `Learnings/` | Technical insights, patterns, troubleshooting |
| `Projects/` | Project notes and progress tracking |
| `Sessions/` | Session logs (auto-generated, git-ignored) |
| `Daily Notes/` | Daily notes (auto-generated, git-ignored) |
| `User Preferences/` | Your work style, design taste, tech stack |
| `Templates/` | Templates for new notes |
| `System/` | Rules and self-learning protocol |
| `scripts/` | Helper scripts (setup, daily notes, UUID generator) |

## Agent Compatibility

| Agent | Setup |
|-------|-------|
| **VS Code Copilot** | Automatic -- reads `.github/copilot-instructions.md` + skills |
| **Cursor** | Copy `.cursorrules` to project root |
| **Claude Code** | Add `CLAUDE.md` to project root |
| **Cline / Continue** | Reads files directly via MCP or file access |
| **Obsidian** | Open as vault -- graph view, backlinks, search |

## Skills

| Skill | What it does |
|-------|-------------|
| `/save-learning` | Save a new insight to the appropriate file |
| `/save-troubleshoot` | Log a problem + solution |
| `/project-update` | Create or update a project note |
| `/brain-review` | Audit the brain for quality and staleness |

## Self-Learning Protocol

The brain learns automatically. When the agent discovers something valuable, it writes it to the appropriate file:

| Trigger | Destination |
|---------|-------------|
| Workaround/fix found | `Learnings/Troubleshooting.md` |
| Pattern seen 2x+ | `Learnings/Patterns.md` |
| New technical insight | `Learnings/[Category].md` |
| Project milestone | `Projects/[name].md` |

See `System/Rules.md` for the full protocol.

## Customization

1. **User Preferences/** -- Fill in your work style, tech stack, communication style, design philosophy
2. **Learnings/** -- Pre-seed with your known patterns and troubleshooting
3. **System/Rules.md** -- Adjust the self-learning triggers and quality rules

## Obsidian Vault

agentBrain doubles as an Obsidian vault:
- Wiki-links (`[[note-name]]`) in Related sections
- Graph view shows connections between notes
- UUID5 IDs in frontmatter for stable cross-referencing
- Run `scripts/uuid5-gen.sh "path/to/note"` to generate IDs

## Scripts

| Script | Usage |
|--------|-------|
| `scripts/setup.sh` | Initialize brain, verify structure, generate config |
| `scripts/uuid5-gen.sh` | Generate deterministic UUID5 for note frontmatter |
| `scripts/update-daily-note.sh` | Add entry to today's daily note |

## License

MIT

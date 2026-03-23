# agentBrain v1.0
> Version: v1.0 (2026-03-23)

Portable, self-learning knowledge base for AI coding agents. Works with VS Code Copilot, Obsidian, Cursor, Cline, Claude Code, and any agent that reads markdown.

## Quick Start

1. Clone once to your home directory:
   ```bash
   git clone https://github.com/your-org/agentBrain.git ~/agentBrain
   ```
2. Run setup (installs agent pointers automatically):
   ```bash
   ~/agentBrain/scripts/setup.sh
   ```
3. Start coding in any project -- your agents now read the brain automatically

That's it. One brain, all projects, all agents.

## How It Works

agentBrain is a **central** external memory -- one installation shared across all your projects. AI agents' internal memories expire (Copilot: 28 days, Claude: per session). agentBrain is permanent.

The setup script installs pointers into each agent's global config (like `~/.claude/CLAUDE.md` for Claude Code, `global_rules.md` for Windsurf, etc.). Every agent in every project reads from the same brain.

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
| **Claude Code** | Auto -- `setup.sh` adds pointer to `~/.claude/CLAUDE.md` |
| **Windsurf** | Auto -- `setup.sh` adds pointer to `global_rules.md` |
| **Cline** | Auto -- `setup.sh` creates `~/Documents/Cline/Rules/agentBrain.md` |
| **VS Code Copilot** | Manual -- add instruction file path in VS Code settings |
| **Cursor** | Manual -- paste path in Settings > Rules |
| **Obsidian** | Open `~/agentBrain` as vault -- graph view, backlinks, search |

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

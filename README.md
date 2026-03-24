---
date: 2026-03-24
type: system
tags: [meta, readme]
id: 5a26c40d-fb39-535c-b6f3-61c572c8983c
---

# agentBrain v1.1
> Version: v1.1 (2026-03-24)

Portable, self-learning knowledge base for AI coding agents. Works with VS Code Copilot, Obsidian, Cursor, Cline, Claude Code, and any agent that reads markdown.

## Quick Start

1. Clone once to your home directory:
   ```bash
   git clone https://github.com/cartmedia/agentBrain.git ~/agentBrain
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
| `.github/skills/` | Slash commands for GitHub Copilot (native format) |
| `Learnings/` | Technical insights, patterns, troubleshooting |
| `local/Projects/` | Your project notes (gitignored, personal) |
| `local/memories/` | Personal context and memories (gitignored) |
| `local/integrations/` | Bot configs, loop runners, API keys (gitignored) |
| `Sessions/` | Session logs (auto-generated, git-ignored) |
| `Daily Notes/` | Daily notes (auto-generated, git-ignored) |
| `User Preferences/` | Your work style, design taste, tech stack |
| `Templates/` | Templates for new notes and project files |
| `System/` | Rules, self-learning protocol, and cross-agent skills |
| `scripts/` | Helper scripts (setup, daily notes, UUID generator) |

### Project convention

`Projects/` is shared (tracked in git) — only the index and examples:
- `Projects/INDEX.md` — project registry (names + status, no secrets)
- `Projects/_example/` — template showing the folder structure

Your actual projects live in `local/Projects/` (gitignored, personal):
```
local/Projects/[name]/
  index.md        (required -- main project note)
  prd.md          (optional -- requirements, user stories)
  decisions.md    (optional -- architecture decision records)
  deploy.md       (optional -- deploy configuration)
  changelog.md    (optional -- change log)
  context.md      (optional -- what to read per phase)
```

## Agent Compatibility

| Agent | Setup |
|-------|-------|
| **Claude Code** | Auto -- `setup.sh` adds pointer to `~/.claude/CLAUDE.md` |
| **Windsurf** | Auto -- `setup.sh` adds pointer to `global_rules.md` |
| **OpenCode** | Auto -- `setup.sh` adds instructions to `~/.config/opencode/opencode.json` |
| **Cline** | Auto -- `setup.sh` creates `~/Documents/Cline/Rules/agentBrain.md` |
| **VS Code Copilot** | Manual -- add instruction file path in VS Code settings |
| **Cursor** | Manual -- paste path in Settings > Rules |
| **Obsidian** | Open `~/agentBrain` as vault -- graph view, backlinks, search |

## Skills

| Skill | What it does |
|-------|-------------|
| `/save-learning` | Save a new insight to the appropriate file |
| `/save-troubleshoot` | Log a problem + solution |
| `/project-update` | Create or update a project (subfolder with index.md + optional files) |
| `/brain-review` | Audit the brain for quality and staleness |
| `/onboard` | Interactive setup to personalize User Preferences |

Skills work in two ways:
- **GitHub Copilot**: native slash commands via `.github/skills/` (SKILL.md format)
- **All other agents** (Claude Code, Cursor, Windsurf, Cline, OpenCode): via `System/Skills.md`, which is read automatically at session start and contains all skill instructions in agent-agnostic markdown

## Self-Learning Protocol

The brain learns automatically. When the agent discovers something valuable, it writes it to the appropriate file:

| Trigger | Destination |
|---------|-------------|
| Workaround/fix found | `Learnings/Troubleshooting.md` |
| Pattern seen 2x+ | `Learnings/Patterns.md` |
| New technical insight | `Learnings/[Category].md` |
| Project milestone | `local/Projects/[name]/index.md` |

See `System/Rules.md` for the full protocol.

## Public vs Personal

agentBrain separates shared knowledge from personal data:

```
~/agentBrain/
├── Learnings/          ← shared (committed to git)
├── System/             ← shared
├── Templates/          ← shared
├── User Preferences/   ← shared (examples, you customize)
└── local/              ← PERSONAL (gitignored, never pushed)
    ├── Projects/       ← your project notes
    ├── Sessions/       ← your session logs
    ├── integrations/   ← bot configs, loop runners, API keys
    └── memories/       ← personal context and memories
```

`git pull` updates shared knowledge without touching `local/`. Your personal data stays private.

## Customization

1. **User Preferences/** -- Fill in your work style, tech stack, communication style, design philosophy
2. **Learnings/** -- Pre-seed with your known patterns and troubleshooting
3. **System/Rules.md** -- Adjust the self-learning triggers and quality rules
4. **local/integrations/** -- Connect bots, dev loops, and external tools

## Obsidian Vault

agentBrain is an Obsidian vault by default. The `.obsidian/` config is tracked in git (minimal, curated); only cache and workspace files are gitignored.

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

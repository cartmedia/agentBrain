# agentBrain

Portable knowledge base for VS Code Copilot. Place this folder in your project root. If you place agentBrain in a subdirectory, adjust all relative paths in `.github/copilot-instructions.md` accordingly.

## Structure
- `.github/copilot-instructions.md` — Copilot reads this automatically
- `.github/skills/` — Agent skills (slash commands)
- `Learnings/` — Technical insights, patterns, troubleshooting
- `Projects/` — Project notes and progress
- `Sessions/` — Session logs per work period
- `Daily Notes/` — Daily notes (auto-generated via script)
- `User Preferences/` — Work style, design, tech stack, communication
- `Templates/` — Templates for new notes
- `System/` — Rules and configuration
- `scripts/` — Helper scripts (daily note update)

## Usage

### Quick Start
1. Clone or copy this repo into your project
2. Copilot picks up `.github/copilot-instructions.md` automatically
3. Reference relevant files in `Learnings/` from there

### How It Works
Copilot reads `.github/copilot-instructions.md` on every interaction. This file references patterns and rules in the `Learnings/` and `System/` folders, giving Copilot context about your workflow and technical decisions.

### Extending
Add new insights to `Learnings/` using the template from `Templates/Learning.md`. Replace `{{date}}` with the date (YYYY-MM-DD) and `{{title}}` with your title. Frontmatter is required:
- **Learning files**: `date`, `type`, `tags`, `confidence`, `source`
- **Project files**: `date`, `type`, `tags`, `status`, `priority`

Copilot picks them up automatically once you reference them in `copilot-instructions.md`.

### Self-Learning
agentBrain is self-learning: Copilot automatically writes new insights, patterns, and troubleshooting fixes to the appropriate files. See `System/Rules.md` for the full protocol.

## Obsidian Vault
agentBrain is also an Obsidian vault. Open the folder in Obsidian for graph view, backlinks, and search. Wiki-links (`[[note-name]]`) are used in Related sections. Each note has a UUID5 `id` in frontmatter for stable identification.

## Compatibility
- **VS Code Copilot** — primary target (reads `.github/copilot-instructions.md` + skills)
- **Obsidian** — open as vault for graph view, backlinks, search
- **Cline / Continue** — supports MCP, can read files directly
- **Cursor** — reads `.cursorrules` (not included, create your own)

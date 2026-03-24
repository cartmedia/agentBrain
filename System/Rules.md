---
date: 2026-03-16
type: system
tags: [meta, rules]
id: d677f5c9-ec8c-57fa-86cf-5ec8b42b883f
---

# agentBrain Rules

## Core Principle
This is an external memory. It grows with every session and becomes smarter over time.
`System/Rules.md` is the detailed policy. `.github/copilot-instructions.md` is the execution spec that Copilot reads automatically.

## Work Style
- Autonomous execution — finish tasks without asking about trivial decisions
- Only interrupt for real blockers
- Better to do one thing well than three things halfway
- Iterative: first make it work, then make it clean, then optimize

## Priorities
1. Does it work? (functionality)
2. Is it understandable? (readability)
3. Is it maintainable? (structure)
4. Is it polished? (design)

## Project Structure

Projects use subfolders instead of single files.

### Convention
- Each project lives in `Projects/[name]/`
- Required: `index.md` (always present)
- Optional: `prd.md`, `decisions.md`, `deploy.md`, `changelog.md`, `context.md`
- `Projects/INDEX.md` must be updated when projects are created or modified
- Templates for all project files are in `Templates/Project-*.md`

### PRD User Stories
Format: `- [ ] US-XX: Als [role] wil ik [action] zodat [benefit]`
This format is parseable by ralph-loop and checklister.

### Decisions
Use ADR-light format (see `Templates/Project-Decisions.md`):
- Numbered: ADR-001, ADR-002, etc.
- Status: proposed / accepted / deprecated / superseded
- Fields: Context, Decision, Consequences

### Changelog
Auto-updated by agents after completing work. Entries grouped by date, most recent first.

## Self-Learning Protocol

agentBrain is a self-learning system. Copilot's internal memories expire after 28 days.
Everything valuable MUST be stored here permanently.

### Step 1: Read at session start
Read at the beginning of every session:
1. `Learnings/Patterns.md` — known patterns
2. `Learnings/Troubleshooting.md` — known problems
3. `System/Lifecycle.md` — project phase definitions
4. Relevant `local/Projects/[name]/index.md` — project context
5. `local/memories/` — personal context (if exists)

### Step 2: Write during session

**Shared knowledge** (committed to git — generic, useful to anyone):
| Trigger | Action |
|---------|--------|
| Workaround/fix found | -> `Learnings/Troubleshooting.md` — add section |
| Pattern recognized 2x+ | -> `Learnings/Patterns.md` — add section |
| Pattern seen 1st time | -> `Learnings/Patterns.md` with `confidence: low`, note "seen 1x" |
| New technical insight | -> `Learnings/[category].md` — new file (see categories below) |
| Library/API limitation discovered | -> `Learnings/Troubleshooting.md` — add section |
| Cross-platform fix | -> `Learnings/Troubleshooting.md` — add section |
| Build/deploy configuration | -> `Learnings/[tool].md` or `Troubleshooting.md` |

**Personal data** (gitignored — project-specific, private):
| Trigger | Action |
|---------|--------|
| New project started | -> `local/Projects/[name]/index.md` — use `Templates/Project-Index.md` |
| Project milestone/decision | -> existing `local/Projects/[name]/` update relevant file |
| Phase transition | -> update `phase:` in `index.md` frontmatter + log in `changelog.md` |
| Session memory | -> `local/memories/` |
| Bot/loop integration config | -> `local/integrations/` |

### Categories for `Learnings/[category].md`
Examples of category files you can create:
- `Learnings/macOS.md` — platform-specific knowledge
- `Learnings/Node.md` — Node.js/npm/Bun specific
- `Learnings/Git.md` — advanced git workflows
- `Learnings/Docker.md` — containers, compose, deploy
- `Learnings/CSS.md` — styling, layout, animations
- `Learnings/Swift.md` — iOS/macOS development

Naming convention: PascalCase, short, technology-oriented.
Only create them when a relevant insight comes up — not preemptively.

### Step 3: Validate
Before writing, check:
- [ ] Does this already exist? -> then UPDATE, not new
- [ ] Is it actionable? -> if not, don't save
- [ ] Is it proven? -> no speculation
- [ ] Is it reproducible? (for troubleshooting)

## Shared vs Personal
- **`Learnings/`** = shared, generic, useful to anyone → committed to git
- **`local/`** = personal, project-specific, private → gitignored
- When in doubt: if it helps only you, it goes in `local/`. If it helps anyone, it goes in `Learnings/`
- Promote: when a personal insight proves broadly useful, move it from `local/memories/` to `Learnings/`

## When NOT to write
- Trivial/one-off information
- Information already in a note
- Speculation without evidence
- Session-specific temporary state

## How to write
- Frontmatter is always required. Per type:
  - **Learning**: `date`, `type`, `tags`, `confidence`, `source`, `id` — tracking insights from sessions/docs
  - **Project**: `date`, `type`, `tags`, `status`, `priority`, `id` — tracking entities, not insights (hence no `confidence`/`source`)
- **`id`**: UUID5 hash, namespace `a3b2c1d0-1234-5678-9abc-def012345678` + `agentBrain/[path]` (without extension)
- **Wiki-links**: use `[[note-name]]` in Related sections (for Obsidian graph view)
- Concise, no prose
- Update > new — update existing notes rather than creating new ones
- Every note must be actionable
- `source: session` for insights from chat, `source: documentation` for docs

## Quality
- Patterns: seen at least 2x for `confidence: high` (1st time: write with `confidence: low`, note "seen 1x")
- Pattern turns out to be wrong? -> update `confidence: retracted` and add why it is incorrect
- Troubleshooting: reproducible
- Outdated info: update or remove
- Staleness check: when tool/library updates happen, review notes for that tool. Notes older than 6 months without updates deserve a check
- Project insight becomes a general pattern? -> move to [[Patterns]], leave cross-ref in project note

## Example: Troubleshooting entry
```markdown
## [Platform/Tool] — [Short description]
- **Problem**: what went wrong
- **Cause**: why
- **Solution**: exact fix
- **Context**: when this occurs
```

## Example: Pattern entry
```markdown
## [Category]
- Pattern description — why it works
- Anti-pattern — why it does not work
```

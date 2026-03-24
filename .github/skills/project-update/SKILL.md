---
name: project-update
description: Create a new project subfolder or update an existing one in agentBrain. Use for a new project, milestone, architecture decision, or status change.
argument-hint: Project name and what you want to record
user-invocable: true
resources:
  - Templates/Project-Index.md
  - Templates/Project-PRD.md
  - Templates/Project-Decisions.md
  - Templates/Project-Deploy.md
  - Templates/Project-Changelog.md
  - Templates/Project-Context.md
  - Projects/_example/index.md
  - System/Rules.md
---

# Project Update

Create or update a project in `Projects/`.

## Steps

### New project
1. **Check if the project already exists** in `Projects/`
2. **Create `Projects/[name]/`** subfolder with at minimum `index.md`:
   - Use `Templates/Project-Index.md` as template
   - Generate UUID5 for `id` field
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
3. **Fill in the sections** of `index.md`:
   - `## Goal` -- what this project does and why
   - `## Setup` -- tech stack, repo location, important commands
   - `## Progress` -- milestones with dates
   - `## Related` -- links to learnings, other projects
4. **Create optional files** as needed:
   - `prd.md` -- requirements, user stories (template: `Templates/Project-PRD.md`)
   - `decisions.md` -- ADR-light records (template: `Templates/Project-Decisions.md`)
   - `deploy.md` -- deploy config (template: `Templates/Project-Deploy.md`)
   - `changelog.md` -- change log (template: `Templates/Project-Changelog.md`)
   - `context.md` -- context map (template: `Templates/Project-Context.md`)
5. **Update `Projects/INDEX.md`** -- add project to the table

### Updating an existing project
1. **Read the existing files** in `Projects/[name]/`
2. **Update the relevant file:**
   - New milestone -> add to `index.md` `## Progress` with date
   - Architecture decision -> add to `decisions.md` (create if missing)
   - Status changed -> update `status` in `index.md` frontmatter
   - Project completed -> set `status: done`
   - Work completed -> add entry to `changelog.md`
3. **Update the `date` in frontmatter** of modified files to today
4. **Update `Projects/INDEX.md`** -- update status/priority/date in the table

### Project insight becomes a general pattern?
If a project-specific insight is broadly applicable:
1. Move it to `Learnings/Patterns.md`
2. Leave a cross-reference in the project note

## References
- Templates: `Templates/Project-*.md`
- Example: `Projects/_example/`
- Rules: `System/Rules.md`

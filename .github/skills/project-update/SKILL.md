---
name: project-update
description: Create a new project note or update an existing one in agentBrain. Use for a new project, milestone, architecture decision, or status change.
argument-hint: Project name and what you want to record
---

# Project Update

Create or update a project note in `Projects/`.

## Steps

### New project
1. **Check if the project already exists** in `Projects/`
2. **Create `Projects/[name].md`** with this frontmatter:
   ```yaml
   ---
   date: YYYY-MM-DD
   type: project
   tags: [relevant, tags]
   status: active/paused/done
   priority: high/medium/low
   ---
   ```
3. **Fill in the sections** according to the template:
   - `## Goal` — what this project does and why
   - `## Setup` — tech stack, repo location, important commands
   - `## Progress` — milestones with dates
   - `## Issues & Solutions` — known problems and fixes
   - `## Related` — links to learnings, other projects

### Updating an existing project
1. **Read the existing note** in `Projects/[name].md`
2. **Update the relevant section:**
   - New milestone -> add to `## Progress` with date
   - Architecture decision -> add to `## Issues & Solutions`
   - Status changed -> update `status` in frontmatter
   - Project completed -> set `status: done`
3. **Update the `date` in frontmatter** to today

### Project insight becomes a general pattern?
If a project-specific insight is broadly applicable:
1. Move it to `Learnings/Patterns.md`
2. Leave a cross-reference in the project note

## References
- Template: `Templates/Project.md`
- Example: `Projects/_example.md`
- Rules: `System/Rules.md`

---
date: 2026-03-24
type: system
tags: [meta, skills]
id: de89875f-dacb-5f07-a964-f6ffc1ec171d
---

# Skills

These skills can be invoked by typing the command name. Any AI agent that reads this file can execute them.

## /save-learning

Save a new insight to agentBrain so it remains permanently available.

### Steps

1. **Determine the type:**
   - Recurring pattern (seen 2x+) -> add to `Learnings/Patterns.md`
   - Pattern seen 1st time -> add to `Learnings/Patterns.md` with `confidence: low`, note "seen 1x"
   - New technical insight -> create `Learnings/[Category].md` (PascalCase, e.g. `macOS.md`, `Node.md`)

2. **Check if it already exists:**
   - Read the relevant file
   - Already there -> UPDATE the existing entry
   - New -> add a new section

3. **Write with the correct format:**
   - Updating an existing file: add a `## Section`
   - Creating a new file: use this frontmatter:
     ```yaml
     ---
     date: YYYY-MM-DD
     type: learning
     tags: [relevant, tags]
     confidence: high/medium/low/retracted
     source: session/documentation
     ---
     ```

4. **Validate:**
   - Is it actionable? (not just "interesting")
   - Is it proven? (no speculation)
   - Is it concise? (no prose)

5. **Confirm to the user** what you saved and where.

---

## /save-troubleshoot

Log a problem + solution in `Learnings/Troubleshooting.md` so it does not need to be researched again.

### Steps

1. **Read `Learnings/Troubleshooting.md`** to understand the current structure.

2. **Determine the section:**
   - Existing section (e.g. `## macOS`, `## Node.js`, `## Git`) -> add entry
   - New category needed -> create a new `## Section`

3. **Write the entry in this format:**
   ```markdown
   ## [Platform/Tool] -- [Short description]
   - **Problem**: what went wrong
   - **Cause**: why it happened
   - **Solution**: exact fix (with code if relevant)
   - **Context**: when this occurs
   ```

4. **If it is a library/API limitation**, include:
   - Which version of the library/API
   - Whether an upstream fix is expected
   - Workaround with code example

5. **Validate:**
   - Is it reproducible?
   - Is the solution tested and confirmed?
   - Is it not already documented?

6. **Confirm to the user** what you logged.

---

## /project-update

Create or update a project in `Projects/`.

### Steps -- New project

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
   - `prd.md` -- requirements and user stories (use `Templates/Project-PRD.md`)
   - `decisions.md` -- architecture decision records (use `Templates/Project-Decisions.md`)
   - `deploy.md` -- deploy configuration (use `Templates/Project-Deploy.md`)
   - `changelog.md` -- change log (use `Templates/Project-Changelog.md`)
   - `context.md` -- context map for agents (use `Templates/Project-Context.md`)
5. **Update `Projects/INDEX.md`** -- add project to the table

### Steps -- Updating an existing project

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

---

## /brain-review

Periodic review of agentBrain to keep the knowledge base healthy.

### Steps

1. **Inventory all files:**
   - Read all files in `Learnings/` and `Projects/`
   - Note the number of files, last update dates, and confidence levels

2. **Check staleness:**
   - Notes older than 6 months without updates -> flag for review
   - Technology-related notes -> check if the tool/library version is still current
   - `confidence: low` entries -> have they been confirmed 2x+ since? Update to `high`

3. **Check quality per note:**
   - Does it have frontmatter with all required fields?
     - Learning: `date`, `type`, `tags`, `confidence`, `source`
     - Project: `date`, `type`, `tags`, `status`, `priority`
   - Is it actionable? (not just "interesting")
   - Is it concise? (no unnecessary text)
   - Does it have a `## Related` section with relevant links?

4. **Check patterns:**
   - Are there entries in `Troubleshooting.md` that are actually patterns? -> move to `Patterns.md`
   - Are there `confidence: retracted` entries that can be removed?
   - Are there duplicate entries?

5. **Check projects:**
   - Projects should be subfolders (`Projects/[name]/`), not single files
   - Each project subfolder must have at least `index.md`
   - `Projects/INDEX.md` should be in sync with actual project folders
   - Are `status: active` projects still active?
   - Are completed projects set to `status: done`?
   - Are there projects that exist but have no note?

6. **Report:**
   - Number of notes per category
   - Outdated notes (older than 6 months)
   - Missing frontmatter
   - Projects not using subfolder structure
   - INDEX.md out of sync
   - Recommendations for cleanup
   - Apply any fixes directly with confirmation

---

## /onboard

Interactive setup that personalizes agentBrain by asking the user targeted questions.

### Steps

1. **Scan for placeholders:**
   Read all files in `User Preferences/`. A file needs onboarding if it contains:
   - `This is an example file` (the default note)
   - `e.g.` hints without actual values
   - Empty sections (only headings, no content below)
   - `<!-- Example:` comments without real content

2. **For each incomplete file, ask focused questions:**

   **Communication.md:**
   - "What language do you prefer for conversation?"
   - "How verbose should I be? (concise / detailed / depends on topic)"
   - "Should I ask before acting, or just do it for trivial decisions?"

   **Tech-Stack.md:**
   - "What's your primary OS and editor?"
   - "What languages and frameworks do you use most?"
   - "Where do you host code? (GitHub, GitLab, self-hosted, etc.)"
   - "Any infrastructure preferences? (Docker, cloud provider, database, etc.)"

   **Design-Philosophy.md:**
   - "Do you have a preferred visual style?"
   - "Dark mode, light mode, or both?"
   - "Any icon/typography preferences?"

   **Decision-Making.md:**
   - "How do you approach technical decisions? (pragmatic, thorough, move fast, etc.)"
   - "Build vs buy -- do you prefer libraries or custom code?"
   - "How important is backwards compatibility vs. clean breaks?"

   **Workflow.md:**
   - "Where do your projects live on disk?"
   - "How autonomous should I be? (ask often / only for blockers / full autonomy)"
   - "Any shell or tooling preferences?"

3. **Write the answers:**
   - Replace placeholder content with the user's actual preferences
   - Remove the `> **Note:** This is an example file` line
   - Keep the existing headings and structure
   - Keep frontmatter unchanged

4. **Only ask about files that still have placeholders.** If some files are already customized, skip them.

5. **Confirm when done.** List which files were updated and suggest running `/brain-review` to validate.

### Rules
- Ask one file at a time -- don't overwhelm with all questions at once
- Accept short answers -- you fill in the structure
- If the user says "skip", move to the next file
- If the user gives partial info, fill in what you can and note what's still missing
- Onboarding is resumable -- it picks up where the user left off

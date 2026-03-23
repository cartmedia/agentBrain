---
name: save-learning
description: Save a new technical insight to agentBrain. Use when you discover a pattern, workaround, or technical fact that is valuable for future sessions.
argument-hint: Describe the insight you want to save
---

# Save Learning

Save a new insight to agentBrain so it remains permanently available.

## Steps

1. **Determine the type of insight:**
   - Recurring pattern (seen 2x+) -> add to `Learnings/Patterns.md`
   - Pattern seen 1st time -> add to `Learnings/Patterns.md` with `confidence: low`, note "seen 1x"
   - New technical insight -> create `Learnings/[Category].md` (PascalCase, e.g. `macOS.md`, `Node.md`)

2. **Check if it already exists:**
   - Read the relevant file
   - If the insight is already there -> UPDATE the existing entry
   - If it is new -> add a new section

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

## References
- Template: `Templates/Learning.md`
- Existing patterns: `Learnings/Patterns.md`
- Rules: `System/Rules.md`

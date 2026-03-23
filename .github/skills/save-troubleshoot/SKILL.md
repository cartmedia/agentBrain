---
name: save-troubleshoot
description: Log a problem and solution in agentBrain Troubleshooting. Use when you fix a bug, find a workaround, or solve a cross-platform issue.
argument-hint: Describe the problem and the solution
---

# Save Troubleshoot

Log a problem + solution in `Learnings/Troubleshooting.md` so it does not need to be researched again.

## Steps

1. **Read `Learnings/Troubleshooting.md`** to understand the current structure.

2. **Determine the section:**
   - Existing section (e.g. `## macOS`, `## Node.js`, `## Git`) -> add entry
   - New category needed -> create a new `## Section`

3. **Write the entry in this format:**
   ```markdown
   ## [Platform/Tool] — [Short description]
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

## References
- Troubleshooting log: `Learnings/Troubleshooting.md`
- Rules: `System/Rules.md`

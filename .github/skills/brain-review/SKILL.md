---
name: brain-review
description: Review agentBrain for outdated notes, missing info, and quality. Use periodically (monthly) or when the knowledge base needs maintenance.
argument-hint: Optional focus area (e.g. "Learnings" or "Projects")
---

# Brain Review

Periodic review of agentBrain to keep the knowledge base healthy.

## Steps

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
   - Are `status: active` projects still active?
   - Are completed projects set to `status: done`?
   - Are there projects that exist but have no note?

6. **Report:**
   - Number of notes per category
   - Outdated notes (older than 6 months)
   - Missing frontmatter
   - Recommendations for cleanup
   - Apply any fixes directly with confirmation

## References
- Rules: `System/Rules.md`
- Patterns: `Learnings/Patterns.md`
- Troubleshooting: `Learnings/Troubleshooting.md`

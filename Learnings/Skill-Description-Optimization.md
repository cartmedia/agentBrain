---
date: 2026-03-23
type: learning
tags: [skills, optimization, triggering]
confidence: high
source: documentation
id: e5f6a7b8-9012-5ef0-1234-567890123ef0
---

# Skill Description Optimization

## Insight
Agent skills are NOT always in context. The AI only sees a list of skill names + short descriptions (~100 words). The description determines whether a skill triggers on a given prompt.

## Key Principles

### Description is Critical
Must contain:
- WHAT the skill does
- WHEN to use it (use cases)
- Relevant keywords that users might type

### Skill Bloat
- Keep skill arsenal limited
- User-scope only for universal skills
- Project-scope for specific workflows
- Too many skills = poor triggering accuracy

### Optimization Process
1. Generate test prompts (should-trigger vs should-not-trigger)
2. Benchmark with and without skill
3. Iterate on description until optimal triggering

### Anti-patterns
- Description too vague ("helps with coding")
- Only WHAT, not WHEN
- Missing keywords that users actually type
- Overlap with other skills

## Related
- [[AgentSkills]] — skill system overview
- [[Rules]] — brain rules

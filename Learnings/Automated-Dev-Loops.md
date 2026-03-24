---
date: 2026-03-24
type: learning
tags: [automation, dev-loop, ralph, ci]
confidence: high
source: session
id: 88d3cca0-d0c9-54dc-8244-bacdd724bac8
---

# Automated Development Loops

## Insight
AI coding agents can run in automated loops — repeating build/test/fix cycles until a task is complete. agentBrain provides persistent context across loop iterations, preventing the agent from repeating mistakes.

## How It Works
```
┌─────────────────────────────────┐
│ Loop iteration N                │
│ 1. Read brain (patterns, issues)│
│ 2. Execute task                 │
│ 3. Run tests                    │
│ 4. Write results to brain       │
│ 5. If tests pass → done         │
│    If tests fail → iteration N+1│
└─────────────────────────────────┘
```

## Key Benefit
Without a brain, each loop iteration starts fresh — the agent may retry the same failed approach. With agentBrain:
- Failed approaches are logged in `Learnings/Troubleshooting.md`
- The agent reads these before each iteration
- No repeated mistakes across loops or sessions

## Integration Points

### Pre-loop: load context
The loop runner injects brain files into the agent's context:
```bash
# Example: pass brain context to agent
CONTEXT="$(cat ~/agentBrain/Learnings/Patterns.md ~/agentBrain/Learnings/Troubleshooting.md)"
agent run --context "$CONTEXT" --task "$TASK"
```

### Post-iteration: save results
After each iteration, write outcomes to the brain:
```bash
# Agent writes directly, or loop runner does it
echo "## Failed approach: X" >> ~/agentBrain/Learnings/Troubleshooting.md
```

### Post-loop: promote learnings
After a successful loop, promote temporary findings to permanent knowledge:
- Move from `local/memories/` to `Learnings/`
- Update `Learnings/Patterns.md` with new confirmed patterns

## Loop Runners
- **Ralph Loop** — Claude Code / OpenCode automated dev cycle
- **Aider** — git-aware AI pair programming with auto-commit
- **Custom scripts** — any bash loop with agent CLI calls

## Configuration
Loop config lives in `local/integrations/` (personal, gitignored):
```json
// local/integrations/ralph.json
{
  "runner": "ralph",
  "brain_read": ["Learnings/Patterns.md", "Learnings/Troubleshooting.md"],
  "brain_write": "local/memories/loop-results.md",
  "max_iterations": 10,
  "promote_on_success": true
}
```

## Related
- [[Bot-Integration]] — similar pattern for chat bots
- [[Memory-Architecture]] — context persistence across sessions
- [[Git-Sync-Multi-Session]] — handling concurrent writes

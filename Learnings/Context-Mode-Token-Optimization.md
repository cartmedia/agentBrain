---
date: 2026-03-23
type: learning
tags: [tokens, optimization, context, mcp]
confidence: high
source: documentation
id: f4d5e6f7-8901-5234-5678-def123456789
---

# Context Window Token Optimization

## Insight
AI agent context windows fill up fast. MCP tool outputs are the biggest offenders — a single Playwright snapshot can be ~56KB. A "context mode" MCP server acts as a virtualization layer, indexing outputs in SQLite and returning compressed references instead.

## The Problem
| Data Type | Raw Size | After Optimization | Reduction |
|-----------|----------|-------------------|-----------|
| Browser snapshot | ~56KB | ~300 bytes | 99% |
| Analytics CSV | Large | ~220 bytes | ~100% |
| Access logs (5000 lines) | ~20KB | ~5KB indexed | 75% |

Planning phases can consume 70% of the context window before any code is written. After ~30 minutes, context compacts and the AI forgets files, tasks, and decisions.

## Session Continuity
The real benefit is session continuity via hooks that monitor:
- File edits
- Git operations
- Sub-agent tasks

On context compaction:
1. Builds a priority-tiered snapshot (<2KB)
2. Injects it back into context
3. Session time extends from ~30 min to ~3 hours

## Error Tracking
Tracks decisions and errors — if a fix failed 20 minutes ago, it won't be retried after context reset.

## When to Use
- Large repo research
- Production-scale log analysis
- Long coding sessions (>30 min)
- Complex multi-file projects
- When context compaction causes repeated mistakes

## Key Insight
"Clearing noise from the context window leaves more room for reasoning — gives the AI space to be a better engineer."

## Related
- [[Memory-Architecture]] — context compaction risk
- [[Patterns]] — optimization patterns

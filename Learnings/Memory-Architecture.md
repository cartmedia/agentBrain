---
date: 2026-03-23
type: learning
tags: [meta, architecture, memory, design]
confidence: high
source: session
id: d4e5f6a7-8901-5def-0123-456789012def
---

# Brain Memory Architecture

## Insight
A two-tier memory system balances always-available context with deep searchable storage.

## Architecture
```
Tier 1: Agent Config (always in context, ~50 lines)
    <-> sync
Tier 2: Brain Vault (searchable, unlimited)
    ├── Sessions/     — auto-saved per session
    ├── Projects/     — active project context
    ├── Learnings/    — knowledge, patterns, troubleshooting
    ├── User Preferences/
    ├── System/       — rules, config sync
    └── Templates/    — structured templates
```

## Design Decisions

### Tier 1 vs Tier 2
- **Tier 1** (agent config): always loaded in context -> must be compact
- **Tier 2** (vault): searchable but not automatically in context -> can be extensive
- **Rule**: Tier 1 contains pointers and essential rules, details live in Tier 2

### Auto-save Mechanisms
- **Pre-compact hook**: triggers before context compression — ideal for knowledge preservation
- **Session-end hook**: triggers at session end — good for summaries
- Pre-compact is most critical (prevents knowledge loss during long sessions)

### Context Compaction Risk
- Biggest risk: knowledge lost when AI context window compresses
- Periodic config review catches session learnings
- Pre-compact hooks can automatically write to brain vault
- Keep agent config lean — audit periodically

## Self-Learning Protocol
The brain grows with every session:
1. **Read at session start**: patterns, troubleshooting, relevant project context
2. **Write during session**: when triggers fire (workaround found, pattern recognized, etc.)
3. **Validate before writing**: no duplicates, must be actionable, must be proven

## Related
- [[Rules]] — self-learning protocol details
- [[Patterns]] — confirmed patterns

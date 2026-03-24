---
date: 2026-03-24
type: learning
tags: [architecture, design, philosophy, integration]
confidence: high
source: session
id: 07768483-b2e2-5e3b-a613-1e417bd6511a
---

# System Architecture: Shared Brain, Loose Limbs

## Insight
The best architecture for an AI-assisted development setup is a central brain with loosely coupled components. Each component has its own repo, lifecycle, and deployment — the only shared contract is reading and writing markdown to the brain.

## The Body Metaphor

| Part | Role | Examples |
|------|------|----------|
| **Brain** | Knowledge, memory, rules | agentBrain |
| **Mouth/ears** | Communication with humans | Chat bots (WhatsApp, Telegram, Slack) |
| **Hands** | Execute tasks, write code | AI coding agents (Claude Code, OpenCode, Cursor, Windsurf) |
| **Feet** | Go places, deploy, automate | CI/CD, dev loops, scheduled tasks |
| **Eyes** | Observe, monitor, report | File watchers, log analyzers, dashboards |

## Why Loose Coupling

A monolithic system (one repo, one deploy) means:
- If the bot breaks, your agents stop too
- Updates require deploying everything
- Testing is all-or-nothing
- One technology choice constrains all components

Loose components sharing a brain means:
- Each component has its own repo and lifecycle
- Replace any part without affecting the rest
- Add new components by just pointing them at the brain
- Technology-agnostic — each part uses whatever fits best

## The Contract

Every component follows the same simple contract:

**Read**: markdown files from `~/agentBrain/Learnings/` and `~/agentBrain/local/`
**Write**: markdown files back to `~/agentBrain/Learnings/` (shared) or `~/agentBrain/local/` (personal)

No APIs, no databases, no message queues. Just files. Any tool that can read and write text files can participate.

## Integration Pattern

```
Component                     agentBrain
─────────                     ──────────
1. Start up          ──→      Read Learnings/, local/memories/
2. Do work           ...      (component-specific)
3. Learn something   ──→      Write to Learnings/ or local/memories/
4. Shut down         ...      Brain persists for next component
```

## Current Components

| Component | Status | Brain Integration |
|-----------|--------|-------------------|
| AI coding agents | Working | Read at session start, write during session |
| Chat bots | Exists (needs refactor) | Read for context, write conversation insights |
| Dev loops | Exists | Read to avoid repeated mistakes, write results |
| Monitoring | Not built | Would read brain state, write observations |

## Anti-patterns

- **Don't make the brain a runtime** — it's files, not a server
- **Don't couple components** — they should not know about each other, only the brain
- **Don't add dependencies to the brain** — it must stay zero-dependency (pure markdown)
- **Don't centralize execution** — each component runs independently

## Related
- [[Memory-Architecture]] — two-tier brain design
- [[Bot-Integration]] — how bots connect to the brain
- [[Automated-Dev-Loops]] — how dev loops use the brain

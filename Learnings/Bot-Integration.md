---
date: 2026-03-24
type: learning
tags: [integration, bots, telegram, whatsapp, automation]
confidence: high
source: session
id: 9dfbee37-afc6-5659-9cb7-9936d898e95e
---

# Bot Integration with agentBrain

## Insight
agentBrain can serve as the knowledge layer for chat bots and AI assistants. The bot reads from the brain for context and writes back insights from conversations.

## Architecture
```
User <-> Bot (Telegram/WhatsApp/Slack)
              |
              v
         Bot Runtime (reads/writes)
              |
              v
         ~/agentBrain/local/integrations/[bot-name].json
         ~/agentBrain/Learnings/  (shared knowledge)
         ~/agentBrain/local/memories/  (personal context)
```

## Integration Pattern

### 1. Bot reads brain at startup
The bot loads relevant files as system context:
- `Learnings/Patterns.md` — coding patterns
- `System/Rules.md` — behavior rules
- `User Preferences/` — communication style

### 2. Bot writes to brain during conversations
When the bot learns something valuable:
- New insight → `Learnings/[Category].md`
- Troubleshooting fix → `Learnings/Troubleshooting.md`
- Personal context → `local/memories/`

### 3. Integration config lives in local/
Bot tokens, API keys, and connection config go in `local/integrations/` — gitignored, never committed.

```json
// local/integrations/telegram-bot.json
{
  "provider": "telegram",
  "brain_paths": {
    "read": ["Learnings/", "System/Rules.md"],
    "write": ["local/memories/"]
  }
}
```

## Supported Bot Frameworks
- **Anthropic Agents SDK** — native tool use, can read/write files directly
- **OpenClaw / Clawdbot** — Telegram bot with memory system
- **Custom bots** — any framework that can read markdown files

## Security
- Bot tokens in `local/integrations/` (gitignored)
- Bots write to `local/memories/` by default (personal, not shared)
- Promote valuable insights from `local/` to `Learnings/` manually

## Related
- [[Patterns]] — what bots should read
- [[Memory-Architecture]] — two-tier memory design

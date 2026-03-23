---
date: 2026-03-23
type: learning
tags: [sessions, parsing, jsonl, import]
confidence: high
source: session
id: f1a2b3c4-d5e6-5f78-9012-abcdef123456
---

# AI Session JSONL Format

## Insight
AI coding agents (Claude Code, Copilot, etc.) store conversations as `.jsonl` files — one JSON object per line. Understanding this format enables session import into the brain vault.

## Message Types
| Type | Content |
|------|---------|
| `user` | User message with `message.content` |
| `assistant` | AI response with `message.content` (may contain `thinking` blocks) |
| `progress` | Hook events (SessionStart, PreCompact, etc.) |
| `file-history-snapshot` | Snapshot of all tracked files at that moment |
| `system` | System messages |

## Key Fields Per Message
- `type` — message type (see above)
- `timestamp` — ISO 8601 timestamp
- `cwd` — working directory (= project context)
- `sessionId` — UUID of the session
- `message.content` — actual text (string or array of content blocks)
- `gitBranch` — active git branch

## Parsing Example
```python
import json

for line in open('session.jsonl'):
    obj = json.loads(line)
    if obj.get('type') == 'user':
        content = obj['message']['content']
        if isinstance(content, list):
            content = ' '.join(c.get('text', '') for c in content if isinstance(c, dict))
        print(content[:150])
```

## Related
- [[Session-Import-Architecture]] — importing sessions into the brain
- [[UUID5-Strategy]] — deterministic IDs for imported sessions

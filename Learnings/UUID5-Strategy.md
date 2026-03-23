---
date: 2026-03-23
type: learning
tags: [meta, architecture, uuid, identification]
confidence: high
source: session
id: a1b2c3d4-5678-5abc-def0-123456789abc
---

# Deterministic UUID5 for Stable Identifiers

## Insight
Use UUID5 (deterministic) instead of UUID4 (random) for entities that have a natural key (file path, URL, project name). Same input always produces the same UUID — safe to re-import without creating duplicates.

## When to Use
| Situation | Use |
|-----------|-----|
| Entity with natural key (path, URL, name) | UUID5 |
| One-time events without repeatability | UUID4 |
| Cross-system references that must stay stable | UUID5 |

## Implementation
- Define a fixed namespace UUID in your config (e.g., `brain.json`)
- Project UUID: `uuid5(NAMESPACE, "project:<path>")`
- Session UUID: `uuid5(NAMESPACE, "session:<session-id>")`
- Deterministic = idempotent = safe re-imports

## Example
```python
import uuid
NAMESPACE = uuid.UUID('a3b2c1d0-1234-5678-9abc-def012345678')
project_id = uuid.uuid5(NAMESPACE, 'project:/path/to/project')
# Always returns the same UUID for the same input
```

## Related
- [[Patterns]] — architecture patterns
- [[Rules]] — frontmatter requirements

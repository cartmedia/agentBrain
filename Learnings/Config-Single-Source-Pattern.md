---
date: 2026-03-23
type: learning
tags: [config, pattern, architecture, python]
confidence: high
source: session
id: f5e6f7a8-9012-5345-6789-ef1234567890
---

# Config Single Source of Truth Pattern

## Insight
When a project has multiple config sources (environment variables, JSON files, defaults), centralizing them in a Config singleton prevents inconsistencies and path-related bugs.

## Pattern
```python
import json
from pathlib import Path

class Config:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance._load()
        return cls._instance

    def _load(self):
        config_path = Path(__file__).parent.parent / "config.json"
        with open(config_path) as f:
            data = json.load(f)
        # Resolve relative paths from config.json location
        base = config_path.parent
        self.inbox_path = base / data["paths"]["inbox"]
        self.output_path = base / data["paths"]["output"]

# Usage everywhere:
from src.config import Config
config = Config()
path = config.inbox_path
```

## Benefits
- One place for all configuration
- Paths relative to config file (not working directory)
- Singleton prevents duplicate loads
- Type hints possible on the Config class

## When to Apply
- Projects with 3+ config values
- When paths appear in multiple files
- When env vars and file config need to coexist

## Related
- [[Patterns]] — code style patterns
- [[Troubleshooting]] — config-related debugging

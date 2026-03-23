---
date: 2026-03-23
type: learning
tags: [obsidian, integration, setup, mcp]
confidence: high
source: session
id: f3c4d5e6-f789-5012-3456-cdef12345678
---

# Obsidian + AI Agent Integration

## Insight
An Obsidian vault makes an excellent persistent memory for AI coding agents. The agent reads/writes markdown files directly, and Obsidian provides graph view, backlinks, and search on top.

## Integration Methods

### Direct File Access (always available)
Most AI agents can read/write files directly. No additional setup needed — just point the agent at the vault directory.

### MCP Server (optional, richer features)
MCP-compatible agents can use an Obsidian MCP server for structured access:
```json
{
  "mcpServers": {
    "obsidian": {
      "command": "npx",
      "args": ["-y", "@mauricio.wolff/mcp-obsidian@latest", "/path/to/vault"]
    }
  }
}
```

## Best Practices
- Use wiki-links (`[[note-name]]`) in Related sections — enables graph view
- Keep frontmatter consistent (the agent needs predictable structure)
- Use MOC (Map of Content) hub notes for navigation
- Agent config (CLAUDE.md, copilot-instructions.md) should contain pointers to vault, not duplicate content

## Improvement Areas for Brain Vaults
Based on analysis of real-world implementations:
1. **Wiki-links**: many notes miss `[[links]]` — Obsidian graph goes underutilized
2. **User Preferences**: often too sparse — expand with concrete examples
3. **Periodic vault analysis**: no automatic pattern discovery in most setups
4. **Daily Notes**: often configured but not actually generated
5. **Agent config as "thinking model"**: should describe HOW the user thinks, not just config

## Related
- [[Memory-Architecture]] — two-tier memory design
- [[AgentSkills]] — skill system for structured workflows

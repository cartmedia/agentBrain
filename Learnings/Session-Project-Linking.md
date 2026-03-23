---
date: 2026-03-23
type: learning
tags: [sessions, projects, linking, obsidian]
confidence: high
source: session
id: f2b3c4d5-e6f7-5890-1234-bcdef1234567
---

# Session-to-Project Linking

## Insight
Session notes should automatically link to the projects they reference. This creates an associative memory via Obsidian backlinks — navigate from any project to all sessions that touched it.

## How It Works
1. Scan all `files_touched` paths in the session for project directory segments
2. Fuzzy-match against existing `Projects/` folders (substring matching)
3. Filter generic parent directories (`tools`, `test`, `tmp`, `sandbox`, `experiments`)
4. Add wiki-links to matched projects in session frontmatter

## Matching Strategy
- Session working directory contains "my-app" → matches `Projects/My-App.md` via substring
- Nested paths (e.g. `tools/org/project`) → match on all path segments
- Generic directories are filtered to avoid false positives

## Frontmatter Result
```yaml
projects: [[[My-App]], [[Other-Project]]]
```
Obsidian backlinks do the rest — click any project to see all related sessions.

## Related
- [[Session-Import-Architecture]] — overall session import design
- [[Patterns]] — architecture patterns

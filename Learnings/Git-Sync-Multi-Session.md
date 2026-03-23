---
date: 2026-03-23
type: learning
tags: [git, sync, troubleshooting, multi-session]
confidence: high
source: session
id: c3d4e5f6-7890-5cde-f012-345678901cde
---

# Git Sync Issues with Multi-Session Brain

## Insight
When multiple AI sessions auto-commit to the same brain repo, diverged branches are inevitable. Standard `git rebase` workflows break down.

## Problem
- Auto-sync hooks from different sessions create parallel commits
- `git rebase` can get stuck in "editing a commit" state
- A stuck rebase blocks all further commits
- Merge conflicts are typically in auto-generated files (Sessions/)

## Solution
1. **Use merge, not rebase**: `git pull --no-rebase` for brain repos
2. **Abort stuck rebases**: `git rebase --abort` to recover
3. **Resolve conflicts**: `git checkout --ours` for session files (local is always more recent)
4. **Avoid interactive rebase** — auto-sync data doesn't need curated history

## Prevention
- Set `git pull --no-rebase` as default for brain repos
- For diverged branches: always merge, never rebase
- Session file conflicts: prefer local (`--ours`) — more recent data wins

## Related
- [[Troubleshooting]] — git troubleshooting
- [[Patterns]] — git patterns

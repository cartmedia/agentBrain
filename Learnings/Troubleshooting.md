---
date: 2026-03-16
type: learning
tags: [troubleshooting, debugging]
confidence: high
source: session
id: b73ceeeb-0d2b-571a-900a-f7fb814ea47f
---

# Troubleshooting Log

## macOS
- `Write` tool can add CRLF line endings -> check with `file script.sh`, fix with `perl -pi -e 's/\r$//'`

## Node.js
- nvm in non-interactive shells: `.bashrc`/`.zshrc` is not loaded -> `source "$HOME/.nvm/nvm.sh"` must be loaded explicitly
- `npm install` slow: check disk I/O, try `--prefer-offline`

## Git
- Pre-commit hook fails: fix the problem, make a NEW commit (not --amend, that modifies the previous commit)
- Authentication fails with GITHUB_TOKEN: `unset GITHUB_TOKEN` and use keyring credentials

## Related
- [[Patterns]] — confirmed patterns and best practices
- [[Rules]] — when and how to save troubleshooting entries

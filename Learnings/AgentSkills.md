---
date: 2026-03-17
type: learning
tags: [copilot, skills, vscode]
confidence: high
source: documentation
id: fb436048-e3c1-55f8-aa85-821e216608ba
---

# Copilot Agent Skills

## Insight
VS Code Copilot supports agent skills via an open standard (agentskills.io). Skills are on-demand loaded workflows in `.github/skills/[name]/SKILL.md` with YAML frontmatter (`name`, `description`, optionally `argument-hint`, `user-invocable`, `disable-model-invocation`). Progressive loading: metadata -> instructions -> resources.

## Context
Relevant when setting up structured workflows for Copilot. Skills vs custom instructions: skills are task-specific and on-demand, instructions are always loaded and global.

## Evidence
VS Code documentation: https://code.visualstudio.com/docs/copilot/customization/agent-skills
Open standard: agentskills.io

## Related
- [[Patterns]] — code patterns
- [[_example]] — example learning note

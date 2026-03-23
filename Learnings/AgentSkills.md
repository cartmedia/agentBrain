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
VS Code Copilot supports agent skills via an open standard (agentskills.io). Skills are on-demand loaded workflows defined in SKILL.md files with YAML frontmatter (`name`, `description`, optionally `argument-hint`, `user-invocable`, `disable-model-invocation`).

## Skill Directory Locations
| Scope | Path |
|-------|------|
| Repository | `.github/skills/[name]/SKILL.md` |
| Claude-style | `.claude/skills/[name]/SKILL.md` |
| Generic agents | `.agents/skills/[name]/SKILL.md` |
| Personal (user-wide) | `~/.copilot/skills/[name]/SKILL.md` |

Repository skills are shared via version control. Personal skills are private to the user and apply across all projects.

## Skills vs Custom Instructions
| Aspect | Skills | Custom Instructions |
|--------|--------|-------------------|
| Loading | On-demand (when triggered) | Always loaded into context |
| Scope | Task-specific workflow | Global behavior/rules |
| Location | `skills/[name]/SKILL.md` | `.github/copilot-instructions.md` or `CLAUDE.md` |
| Token cost | Only when activated | Every message |
| Use case | "How to deploy", "Run tests" | "Use tabs not spaces", "Respond in Dutch" |

## Progressive Loading Model
Skills load in three stages to minimize token usage:
1. **Discovery** — agent reads only `name` + `description` from frontmatter (minimal tokens)
2. **Instructions** — when skill is triggered, the full SKILL.md body is loaded
3. **Resources** — referenced files (`resources:` frontmatter) are loaded only if needed

This means a project can have dozens of skills without bloating the context window.

## Context
Relevant when setting up structured workflows for AI coding agents. The open standard at agentskills.io aims for cross-agent compatibility.

## Evidence
VS Code documentation: https://code.visualstudio.com/docs/copilot/customization/agent-skills
Open standard: agentskills.io

## Related
- [[Patterns]] — code patterns
- [[Obsidian-Agent-Integration]] — agent memory integration
- [[Context-Mode-Token-Optimization]] — token management strategies

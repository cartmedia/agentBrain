---
date: 2026-03-17
type: learning
tags: [copilot, skills, vscode]
confidence: high
source: documentation
---

# Copilot Agent Skills

## Inzicht
VS Code Copilot ondersteunt agent skills via open standaard (agentskills.io). Skills zijn on-demand geladen workflows in `.github/skills/[naam]/SKILL.md` met YAML frontmatter (`name`, `description`, optioneel `argument-hint`, `user-invocable`, `disable-model-invocation`). Progressive loading: metadata → instructies → resources.

## Context
Relevant bij het opzetten van gestructureerde workflows voor Copilot. Skills vs custom instructions: skills zijn taak-specifiek en on-demand, instructions zijn altijd geladen en globaal.

## Bewijs
VS Code documentatie: https://code.visualstudio.com/docs/copilot/customization/agent-skills
Open standaard: agentskills.io

## Gerelateerd
- `Learnings/Patterns.md` — code patronen
- `Projects/_voorbeeld.md` — agentBrain project

---
name: onboard
description: Interactive onboarding for new agentBrain users. Detects placeholder content in User Preferences and asks targeted questions to personalize the brain. Use on first setup or when preferences are incomplete.
argument-hint: Optional focus area (e.g. "tech-stack" or "communication")
user-invocable: true
resources:
  - User Preferences/Communication.md
  - User Preferences/Decision-Making.md
  - User Preferences/Design-Philosophy.md
  - User Preferences/Tech-Stack.md
  - User Preferences/Workflow.md
---

# Onboard

Interactive setup that personalizes agentBrain by asking the user targeted questions.

## Steps

1. **Scan for placeholders:**
   Read all files in `User Preferences/`. A file needs onboarding if it contains:
   - `This is an example file` (the default note)
   - `e.g.` hints without actual values
   - Empty sections (only headings, no content below)
   - `<!-- Example:` comments without real content

2. **For each incomplete file, ask focused questions:**

   ### Communication.md
   - "What language do you prefer for conversation? (e.g. English, Dutch, mixed)"
   - "How verbose should I be? (concise / detailed / depends on topic)"
   - "Should I ask before acting, or just do it for trivial decisions?"

   ### Tech-Stack.md
   - "What's your primary OS and editor?"
   - "What languages and frameworks do you use most?"
   - "Where do you host code? (GitHub, GitLab, self-hosted, etc.)"
   - "Any infrastructure preferences? (Docker, cloud provider, database, etc.)"

   ### Design-Philosophy.md
   - "Do you have a preferred visual style? (minimal, Material, custom design system, etc.)"
   - "Dark mode, light mode, or both?"
   - "Any icon/typography preferences?"

   ### Decision-Making.md
   - "How do you approach technical decisions? (pragmatic, thorough, move fast, etc.)"
   - "Build vs buy — do you prefer libraries or custom code?"
   - "How important is backwards compatibility vs. clean breaks?"

   ### Workflow.md
   - "Where do your projects live on disk?"
   - "How autonomous should I be? (ask often / only for blockers / full autonomy)"
   - "Any shell or tooling preferences? (zsh, bash, package managers, etc.)"

3. **Write the answers:**
   - Replace placeholder content with the user's actual preferences
   - Remove the `> **Note:** This is an example file` line
   - Keep the existing headings and structure
   - Keep frontmatter unchanged

4. **Only ask about files that still have placeholders.**
   If some files are already customized, skip them and say which ones look good.

5. **Confirm when done:**
   List which files were updated and suggest running `/brain-review` to validate.

## Resumable
Onboarding is resumable. The agent checks which files still have placeholders:
- If the user ran `/onboard` before but only finished 2 of 5 files, it picks up where they left off
- Already-customized files (no "This is an example file" marker) are skipped automatically
- The user can run `/onboard tech-stack` to onboard a single file

## Rules
- Ask one file at a time — don't overwhelm with all questions at once
- Accept short answers — you fill in the structure
- If the user says "skip", move to the next file
- If the user gives partial info, fill in what you can and note what's still missing
- After each file, confirm what was written and ask "Continue to the next, or stop here?"

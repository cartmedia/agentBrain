#!/usr/bin/env bash
# setup.sh — Initialize agentBrain for first-time use.
# Run this after cloning to verify the structure is complete.

set -euo pipefail

VAULT="$(cd "$(dirname "$0")/.." && pwd)"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "Setting up agentBrain in: ${VAULT}"
echo ""

# Required directories
DIRS=("Learnings" "Projects" "Sessions" "Daily Notes" "User Preferences" "Templates" "System" "scripts")
for dir in "${DIRS[@]}"; do
  if [ ! -d "${VAULT}/${dir}" ]; then
    mkdir -p "${VAULT}/${dir}"
    echo -e "${GREEN}Created${NC} ${dir}/"
  fi
done

# Ensure .gitkeep in directories that should persist when empty
KEEPDIRS=("Sessions" "Daily Notes" "Projects")
for dir in "${KEEPDIRS[@]}"; do
  if [ ! -f "${VAULT}/${dir}/.gitkeep" ]; then
    touch "${VAULT}/${dir}/.gitkeep"
    echo -e "${GREEN}Created${NC} ${dir}/.gitkeep"
  fi
done

# Generate brain.json with UUID5 namespace if missing
if [ ! -f "${VAULT}/brain.json" ]; then
  NAMESPACE=$(python3 -c "import uuid; print(uuid.uuid4())")
  cat > "${VAULT}/brain.json" <<JSON
{
  "namespace": "${NAMESPACE}",
  "version": "1.0",
  "created": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
}
JSON
  echo -e "${GREEN}Created${NC} brain.json (UUID5 namespace: ${NAMESPACE})"
else
  echo -e "${YELLOW}Exists${NC}  brain.json"
fi

# Validate templates
TEMPLATES=("Learning.md" "Project.md" "Session.md" "Daily.md")
MISSING=0
for tmpl in "${TEMPLATES[@]}"; do
  if [ ! -f "${VAULT}/Templates/${tmpl}" ]; then
    echo -e "${YELLOW}Missing${NC} Templates/${tmpl}"
    MISSING=$((MISSING + 1))
  fi
done

# Check required system files
if [ ! -f "${VAULT}/System/Rules.md" ]; then
  echo -e "${YELLOW}Missing${NC} System/Rules.md — self-learning protocol won't work"
fi

if [ ! -f "${VAULT}/.github/copilot-instructions.md" ]; then
  echo -e "${YELLOW}Missing${NC} .github/copilot-instructions.md — Copilot won't load brain context"
fi

# Summary
echo ""
echo "─────────────────────────────────────────"
LEARNINGS=$(find "${VAULT}/Learnings" -name "*.md" ! -name "_*" 2>/dev/null | wc -l | tr -d ' ')
PROJECTS=$(find "${VAULT}/Projects" -name "*.md" ! -name "_*" 2>/dev/null | wc -l | tr -d ' ')
SKILLS=$(find "${VAULT}/.github/skills" -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')
echo "  Learnings:  ${LEARNINGS} notes"
echo "  Projects:   ${PROJECTS} notes"
echo "  Skills:     ${SKILLS} available"
echo "  Templates:  $((${#TEMPLATES[@]} - MISSING))/${#TEMPLATES[@]} present"
echo "─────────────────────────────────────────"
echo ""
# Check onboarding status
PLACEHOLDER_COUNT=0
for pref in "${VAULT}/User Preferences"/*.md; do
  if [ -f "$pref" ] && grep -q "This is an example file" "$pref" 2>/dev/null; then
    PLACEHOLDER_COUNT=$((PLACEHOLDER_COUNT + 1))
  fi
done

# Detect available tools
HAS_OBSIDIAN=false
HAS_VSCODE=false
if [ -d "/Applications/Obsidian.app" ] || command -v obsidian &>/dev/null; then
  HAS_OBSIDIAN=true
fi
if [ -d "/Applications/Visual Studio Code.app" ] || command -v code &>/dev/null; then
  HAS_VSCODE=true
fi

echo ""
echo "Next steps:"
if [ "$PLACEHOLDER_COUNT" -gt 0 ]; then
  echo "  1. Personalize your brain: run /onboard in your AI agent"
  echo "     (${PLACEHOLDER_COUNT} of 5 preference files still have defaults)"
else
  echo "  1. Preferences are set up!"
fi
if [ "$HAS_VSCODE" = true ]; then
  echo "  2. Open in VS Code — Copilot reads .github/copilot-instructions.md"
else
  echo "  2. Open in your editor — agent reads CLAUDE.md or .cursorrules"
fi
if [ "$HAS_OBSIDIAN" = true ]; then
  echo "  3. Open in Obsidian — graph view, backlinks, search"
else
  echo "  3. Optional: install Obsidian (https://obsidian.md) for graph view"
fi
echo "  4. Start coding — agentBrain learns automatically"

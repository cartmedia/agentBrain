#!/usr/bin/env bash
# setup.sh — Initialize agentBrain and install agent pointers.
# Run once after cloning. Safe to re-run (idempotent).

set -euo pipefail

# Ensure Homebrew is in PATH (macOS)
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null)" || true

VAULT="$(cd "$(dirname "$0")/.." && pwd)"
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo "Setting up agentBrain in: ${VAULT}"
echo ""

# ── 0. Dependencies ──────────────────────────

MISSING_DEPS=false

if ! command -v git &>/dev/null; then
  echo -e "${YELLOW}Missing${NC}  git (required)"
  MISSING_DEPS=true
fi

if ! command -v python3 &>/dev/null; then
  echo -e "${YELLOW}Missing${NC}  python3 (required for UUID5 generation)"
  MISSING_DEPS=true
fi

if [ "$MISSING_DEPS" = true ]; then
  if [ -t 0 ] && command -v brew &>/dev/null; then
    read -p "Install missing dependencies via Homebrew? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      command -v git &>/dev/null || brew install git
      command -v python3 &>/dev/null || brew install python3
    else
      echo "Please install missing dependencies and re-run setup."
      exit 1
    fi
  elif [ -t 0 ] && command -v apt-get &>/dev/null; then
    read -p "Install missing dependencies via apt? [y/N] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      sudo apt-get update -qq
      command -v git &>/dev/null || sudo apt-get install -y git
      command -v python3 &>/dev/null || sudo apt-get install -y python3
    else
      echo "Please install missing dependencies and re-run setup."
      exit 1
    fi
  else
    echo "Please install git and python3, then re-run setup."
    exit 1
  fi
fi

# ── 1. Structure ──────────────────────────────

# Shared directories (tracked in git)
DIRS=("Learnings" "Projects" "Sessions" "Daily Notes" "User Preferences" "Templates" "System" "scripts")
for dir in "${DIRS[@]}"; do
  if [ ! -d "${VAULT}/${dir}" ]; then
    mkdir -p "${VAULT}/${dir}"
    echo -e "${GREEN}Created${NC} ${dir}/"
  fi
done

# Personal directories (gitignored)
LOCAL_DIRS=("local/Projects" "local/Sessions" "local/memories" "local/integrations")
for dir in "${LOCAL_DIRS[@]}"; do
  if [ ! -d "${VAULT}/${dir}" ]; then
    mkdir -p "${VAULT}/${dir}"
    echo -e "${GREEN}Created${NC} ${dir}/"
  fi
done

KEEPDIRS=("Sessions" "Daily Notes" "Projects")
for dir in "${KEEPDIRS[@]}"; do
  if [ ! -f "${VAULT}/${dir}/.gitkeep" ]; then
    touch "${VAULT}/${dir}/.gitkeep"
    echo -e "${GREEN}Created${NC} ${dir}/.gitkeep"
  fi
done

# ── 2. Brain config ──────────────────────────

if [ ! -f "${VAULT}/brain.json" ]; then
  NAMESPACE=$(python3 -c "import uuid; print(uuid.uuid4())")
  cat > "${VAULT}/brain.json" <<JSON
{
  "namespace": "${NAMESPACE}",
  "version": "1.0",
  "created": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "path": "${VAULT}"
}
JSON
  echo -e "${GREEN}Created${NC} brain.json (namespace: ${NAMESPACE})"
else
  echo -e "${YELLOW}Exists${NC}  brain.json"
fi

# ── 3. Install agent pointers ────────────────
# Each agent gets a global config that points to this brain.
# Like ClaudeBrain: one vault, agents reference it by path.

echo ""
echo -e "${CYAN}Installing agent pointers...${NC}"

POINTER_BLOCK="# agentBrain — persistent knowledge base
# Path: ${VAULT}
# Read at session start:
#   ${VAULT}/Learnings/Patterns.md
#   ${VAULT}/Learnings/Troubleshooting.md
#   ${VAULT}/System/Rules.md
#   ${VAULT}/System/Skills.md
#   ${VAULT}/User Preferences/"

# ── Claude Code ──
CLAUDE_DIR="$HOME/.claude"
CLAUDE_MD="${CLAUDE_DIR}/CLAUDE.md"
if [ ! -d "${CLAUDE_DIR}" ]; then
  mkdir -p "${CLAUDE_DIR}"
  echo -e "${GREEN}Created${NC} ~/.claude/"
fi
MARKER="# agentBrain"
if [ -f "${CLAUDE_MD}" ] && grep -q "${MARKER}" "${CLAUDE_MD}" 2>/dev/null; then
  echo -e "${YELLOW}Exists${NC}  Claude Code pointer in ~/.claude/CLAUDE.md"
else
  cat >> "${CLAUDE_MD}" <<CLAUDE

## agentBrain
# Persistent knowledge base at ${VAULT}
# Read these at session start:
- Patterns: \`${VAULT}/Learnings/Patterns.md\`
- Troubleshooting: \`${VAULT}/Learnings/Troubleshooting.md\`
- Rules: \`${VAULT}/System/Rules.md\`
- Skills: \`${VAULT}/System/Skills.md\`
- Preferences: \`${VAULT}/User Preferences/\`

# Self-learning: write insights to the brain during sessions.
# See \`${VAULT}/System/Rules.md\` for the full protocol.
CLAUDE
  echo -e "${GREEN}Added${NC}   Claude Code pointer to ~/.claude/CLAUDE.md"
fi

# ── VS Code Copilot (global settings) ──
# Cross-platform settings path
# Check Code, Code-Insiders, and VSCodium
VSCODE_SETTINGS=""
if [ "$(uname)" = "Darwin" ]; then
  VSCODE_CANDIDATES=(
    "$HOME/Library/Application Support/Code/User/settings.json"
    "$HOME/Library/Application Support/Code - Insiders/User/settings.json"
    "$HOME/Library/Application Support/VSCodium/User/settings.json"
  )
else
  VSCODE_BASE="${XDG_CONFIG_HOME:-$HOME/.config}"
  VSCODE_CANDIDATES=(
    "${VSCODE_BASE}/Code/User/settings.json"
    "${VSCODE_BASE}/Code - Insiders/User/settings.json"
    "${VSCODE_BASE}/VSCodium/User/settings.json"
  )
fi
for candidate in "${VSCODE_CANDIDATES[@]}"; do
  [ -f "$candidate" ] && VSCODE_SETTINGS="$candidate" && break
done
if [ -n "${VSCODE_SETTINGS}" ]; then
  if grep -q "agentBrain" "${VSCODE_SETTINGS}" 2>/dev/null; then
    echo -e "${YELLOW}Exists${NC}  Copilot pointer in VS Code settings"
  else
    echo -e "${YELLOW}Manual${NC}  VS Code Copilot: add to settings.json:"
    echo "         \"github.copilot.chat.codeGeneration.instructions\": ["
    echo "           { \"file\": \"${VAULT}/.github/copilot-instructions.md\" }"
    echo "         ]"
  fi
else
  echo -e "${YELLOW}Skip${NC}    VS Code Copilot (not installed)"
fi

# ── Windsurf ──
WINDSURF_RULES="$HOME/.codeium/windsurf/memories/global_rules.md"
WINDSURF_DIR="$(dirname "${WINDSURF_RULES}")"
if [ -d "$HOME/.codeium" ] || [ -d "/Applications/Windsurf.app" ]; then
  mkdir -p "${WINDSURF_DIR}"
  MARKER="# agentBrain"
  if [ -f "${WINDSURF_RULES}" ] && grep -q "${MARKER}" "${WINDSURF_RULES}" 2>/dev/null; then
    echo -e "${YELLOW}Exists${NC}  Windsurf pointer in global_rules.md"
  else
    cat >> "${WINDSURF_RULES}" <<WINDSURF

# agentBrain — persistent knowledge base
# Path: ${VAULT}
# Read at session start:
# - ${VAULT}/Learnings/Patterns.md
# - ${VAULT}/Learnings/Troubleshooting.md
# - ${VAULT}/System/Rules.md
# - ${VAULT}/System/Skills.md
# Self-learning: write insights during sessions. See ${VAULT}/System/Rules.md
WINDSURF
    echo -e "${GREEN}Added${NC}   Windsurf pointer to global_rules.md"
  fi
else
  echo -e "${YELLOW}Skip${NC}    Windsurf (not installed)"
fi

# ── Cursor ──
if [ -d "/Applications/Cursor.app" ]; then
  echo -e "${YELLOW}Manual${NC}  Cursor: paste into Settings > Rules:"
  echo "         \"Read ${VAULT}/System/Rules.md, ${VAULT}/System/Skills.md, and ${VAULT}/Learnings/Patterns.md at session start.\""
else
  echo -e "${YELLOW}Skip${NC}    Cursor (not installed)"
fi

# ── Cline ──
CLINE_RULES="$HOME/Documents/Cline/Rules"
if [ -d "$HOME/Documents/Cline" ] || [ -d "$HOME/.vscode/extensions" ]; then
  mkdir -p "${CLINE_RULES}"
  CLINE_FILE="${CLINE_RULES}/agentBrain.md"
  if [ -f "${CLINE_FILE}" ]; then
    echo -e "${YELLOW}Exists${NC}  Cline pointer in ~/Documents/Cline/Rules/"
  else
    cat > "${CLINE_FILE}" <<CLINE
# agentBrain
Persistent knowledge base at ${VAULT}

Read at session start:
- ${VAULT}/Learnings/Patterns.md
- ${VAULT}/Learnings/Troubleshooting.md
- ${VAULT}/System/Rules.md
- ${VAULT}/System/Skills.md

Self-learning: write insights during sessions. See ${VAULT}/System/Rules.md
CLINE
    echo -e "${GREEN}Added${NC}   Cline pointer to ~/Documents/Cline/Rules/"
  fi
else
  echo -e "${YELLOW}Skip${NC}    Cline (not installed)"
fi

# ── OpenCode ──
OPENCODE_CONFIG="$HOME/.config/opencode/opencode.json"
if [ -d "/Applications/OpenCode.app" ] || command -v opencode &>/dev/null; then
  mkdir -p "$(dirname "${OPENCODE_CONFIG}")"
  if [ -f "${OPENCODE_CONFIG}" ] && grep -q "agentBrain" "${OPENCODE_CONFIG}" 2>/dev/null; then
    echo -e "${YELLOW}Exists${NC}  OpenCode pointer in opencode.json"
  else
    if [ -f "${OPENCODE_CONFIG}" ]; then
      # Add instructions to existing config
      if python3 -c "
import json, sys
with open('${OPENCODE_CONFIG}') as f:
    cfg = json.load(f)
instructions = cfg.get('instructions', [])
brain_files = ['${VAULT}/System/Rules.md', '${VAULT}/System/Skills.md', '${VAULT}/Learnings/Patterns.md', '${VAULT}/Learnings/Troubleshooting.md']
for bf in brain_files:
    if bf not in instructions:
        instructions.append(bf)
cfg['instructions'] = instructions
with open('${OPENCODE_CONFIG}', 'w') as f:
    json.dump(cfg, f, indent=2)
" 2>/dev/null; then
        echo -e "${GREEN}Added${NC}   OpenCode instructions to opencode.json"
      fi
    else
      cat > "${OPENCODE_CONFIG}" <<OPENCODE
{
  "instructions": [
    "${VAULT}/System/Rules.md",
    "${VAULT}/System/Skills.md",
    "${VAULT}/Learnings/Patterns.md",
    "${VAULT}/Learnings/Troubleshooting.md"
  ]
}
OPENCODE
      echo -e "${GREEN}Created${NC} OpenCode config with agentBrain instructions"
    fi
  fi
else
  echo -e "${YELLOW}Skip${NC}    OpenCode (not installed)"
fi

# ── 4. Validate ──────────────────────────────

echo ""
TEMPLATES=("Learning.md" "Project.md" "Session.md" "Daily.md")
MISSING=0
for tmpl in "${TEMPLATES[@]}"; do
  [ ! -f "${VAULT}/Templates/${tmpl}" ] && MISSING=$((MISSING + 1))
done

LEARNINGS=$(find "${VAULT}/Learnings" -name "*.md" ! -name "_*" 2>/dev/null | wc -l | tr -d ' ')
# Projects split: shared (tracked) vs local (personal)
SHARED_PROJECTS=$(find "${VAULT}/Projects" -name "*.md" ! -name "_*" 2>/dev/null | wc -l | tr -d ' ')
LOCAL_PROJECTS=$(find "${VAULT}/local/Projects" -name "*.md" ! -name "_*" 2>/dev/null | wc -l | tr -d ' ')
SKILLS=$(find "${VAULT}/.github/skills" -name "SKILL.md" 2>/dev/null | wc -l | tr -d ' ')

echo "─────────────────────────────────────────"
echo "  Learnings:  ${LEARNINGS} notes"
echo "  Projects:   ${LOCAL_PROJECTS} personal, ${SHARED_PROJECTS} shared"
echo "  Skills:     ${SKILLS} available"
echo "  Templates:  $((${#TEMPLATES[@]} - MISSING))/${#TEMPLATES[@]} present"
echo "─────────────────────────────────────────"

# ── 5. Onboarding check ─────────────────────

PLACEHOLDER_COUNT=0
for pref in "${VAULT}/User Preferences"/*.md; do
  [ -f "$pref" ] && grep -q "This is an example file" "$pref" 2>/dev/null && PLACEHOLDER_COUNT=$((PLACEHOLDER_COUNT + 1))
done

echo ""
echo "Next steps:"
if [ "$PLACEHOLDER_COUNT" -gt 0 ]; then
  echo "  1. Personalize: run /onboard in your AI agent"
  echo "     (${PLACEHOLDER_COUNT} of 5 preference files still have defaults)"
else
  echo "  1. Preferences are set up!"
fi
echo "  2. Start coding — agents read the brain automatically"

if [ -d "/Applications/Obsidian.app" ] || command -v obsidian &>/dev/null; then
  echo "  3. Open in Obsidian for graph view + search"
else
  echo "  3. Install Obsidian (https://obsidian.md) and open ~/agentBrain as vault"
fi

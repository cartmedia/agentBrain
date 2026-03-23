#!/usr/bin/env bash
# uuid5-gen.sh — Generate a deterministic UUID5 for agentBrain notes.
# Usage: ./uuid5-gen.sh "Learnings/MyNote"

set -euo pipefail

VAULT="$(cd "$(dirname "$0")/.." && pwd)"

if [ -z "${1:-}" ]; then
  echo "Usage: $(basename "$0") \"path/to/note\" (without .md extension)"
  echo "Example: $(basename "$0") \"Learnings/Docker\""
  exit 1
fi

# Read namespace from brain.json, or use default
if [ -f "${VAULT}/brain.json" ]; then
  NAMESPACE=$(python3 -c "import json; print(json.load(open('${VAULT}/brain.json'))['namespace'])")
else
  NAMESPACE="a3b2c1d0-1234-5678-9abc-def012345678"
  echo "Warning: brain.json not found, using default namespace. Run setup.sh first." >&2
fi

UUID=$(python3 -c "import uuid; print(uuid.uuid5(uuid.UUID('${NAMESPACE}'), 'agentBrain/${1}'))")
echo "${UUID}"

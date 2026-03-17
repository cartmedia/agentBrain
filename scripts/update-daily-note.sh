#!/usr/bin/env bash
# update-daily-note.sh — Voegt een regel toe aan de daily note van vandaag.
# Maakt de daily note aan vanuit template als die nog niet bestaat.
#
# Gebruik:
#   ./update-daily-note.sh "Korte beschrijving van wat er is gedaan"
#   ./update-daily-note.sh --sectie notities "Een losse notitie"
#
# Secties: sessies (default), notities, links

set -euo pipefail

# Detecteer vault root (parent van scripts/)
VAULT="$(cd "$(dirname "$0")/.." && pwd)"
DAILY_DIR="${VAULT}/Daily Notes"
TEMPLATE="${VAULT}/Templates/Daily.md"
TODAY=$(date '+%Y-%m-%d')
DAILY_FILE="${DAILY_DIR}/${TODAY}.md"

# Parse argumenten
SECTIE="Sessies"
BESCHRIJVING=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --sectie|-s)
      case "${2,,}" in
        sessies|sessie)   SECTIE="Sessies" ;;
        notities|notitie) SECTIE="Notities" ;;
        links|link)       SECTIE="Links" ;;
        *)                SECTIE="$2" ;;
      esac
      shift 2
      ;;
    *)
      BESCHRIJVING="$1"
      shift
      ;;
  esac
done

if [ -z "$BESCHRIJVING" ]; then
  echo "Gebruik: $(basename "$0") [-s sectie] \"beschrijving\""
  echo "Secties: sessies (default), notities, links"
  exit 1
fi

# Maak Daily Notes directory aan als die niet bestaat
mkdir -p "$DAILY_DIR"

# Maak daily note aan vanuit template als die niet bestaat
if [ ! -f "$DAILY_FILE" ]; then
  if [ -f "$TEMPLATE" ]; then
    sed "s/{{date}}/${TODAY}/g" "$TEMPLATE" > "$DAILY_FILE"
    echo "Daily note aangemaakt: ${DAILY_FILE}"
  else
    cat > "$DAILY_FILE" <<TMPL
---
date: ${TODAY}
type: daily
tags: [daily]
---

# ${TODAY}

## Sessies
-

## Notities
-

## Links
-
TMPL
    echo "Daily note aangemaakt (zonder template): ${DAILY_FILE}"
  fi
fi

# Zoek de sectie en voeg de regel toe
SECTIE_HEADER="## ${SECTIE}"

if grep -q "^${SECTIE_HEADER}$" "$DAILY_FILE"; then
  awk -v sectie="$SECTIE_HEADER" -v regel="- ${BESCHRIJVING}" '
    BEGIN { in_sectie = 0; toegevoegd = 0 }
    /^## / {
      if (in_sectie && !toegevoegd) {
        print regel
        toegevoegd = 1
      }
      in_sectie = ($0 == sectie) ? 1 : 0
    }
    { print }
    END {
      if (in_sectie && !toegevoegd) {
        print regel
      }
    }
  ' "$DAILY_FILE" > "${DAILY_FILE}.tmp" && mv "${DAILY_FILE}.tmp" "$DAILY_FILE"
else
  echo "" >> "$DAILY_FILE"
  echo "${SECTIE_HEADER}" >> "$DAILY_FILE"
  echo "- ${BESCHRIJVING}" >> "$DAILY_FILE"
fi

echo "Toegevoegd aan ${SECTIE}: ${BESCHRIJVING}"

#!/bin/bash
# .claude/hooks/protect-files.sh – PreToolUse (Edit|Write): sekrety, konfiguracja produkcyjna, istniejące migracje
if ! command -v jq >/dev/null 2>&1; then
  echo "Hook protect-files wymaga jq (Windows: winget install jqlang.jq). Edycja wstrzymana." >&2
  exit 2
fi

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')
FILE="${FILE//\\//}"   # ścieżki z Windows: backslash → slash
[ -z "$FILE" ] && exit 0

# 1. Konfiguracja produkcyjna i sekrety – nigdy
case "$FILE" in
  *appsettings.Production.json|*/.env|*/.env.*)
    echo "Blocked: $FILE to plik produkcyjny lub sekret. Poproś użytkownika o ręczną zmianę." >&2
    exit 2 ;;
esac

# 2. Migracje EF Core – tylko nowe pliki; istniejące (śledzone przez gita) są nietykalne
if [[ "$FILE" == */Migrations/* ]] && git -C "$CLAUDE_PROJECT_DIR" ls-files --error-unmatch "$FILE" >/dev/null 2>&1; then
  echo "Blocked: $FILE to istniejąca migracja. Zamiast edytować, utwórz nową migrację." >&2
  exit 2
fi

exit 0

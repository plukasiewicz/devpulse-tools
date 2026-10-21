#!/bin/bash
# .claude/hooks/guard-commands.sh – PreToolUse (Bash): database update i push do main zawsze wymagają decyzji
if ! command -v jq >/dev/null 2>&1; then
  echo "Hook guard-commands wymaga jq (Windows: winget install jqlang.jq). Komenda wstrzymana." >&2
  exit 2
fi

CMD=$(jq -r '.tool_input.command // empty')

if echo "$CMD" | grep -Eq 'dotnet ef database update|git push.*\bmain\b'; then
  jq -n '{hookSpecificOutput: {
    hookEventName: "PreToolUse",
    permissionDecision: "ask",
    permissionDecisionReason: "Zmiana bazy danych lub push do main – wymaga decyzji człowieka."
  }}'
  exit 0
fi

exit 0

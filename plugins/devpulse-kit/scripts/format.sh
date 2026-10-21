#!/bin/bash
# .claude/hooks/format.sh – formatuje plik, który właśnie zmienił agent (PostToolUse, Edit|Write)
command -v jq >/dev/null 2>&1 || exit 0   # bez jq po prostu nie formatujemy

FILE=$(jq -r '.tool_input.file_path // empty')
[ -z "$FILE" ] && exit 0

case "$FILE" in
  *.cs)
    dotnet format "$CLAUDE_PROJECT_DIR/src/DevPulse.sln" --include "$FILE" --verbosity quiet
    ;;
  *.ts|*.tsx)
    (cd "$CLAUDE_PROJECT_DIR/frontend" && npx prettier --write "$FILE")
    ;;
esac

exit 0   # formatowanie nie blokuje pracy agenta, nawet gdy się nie powiedzie

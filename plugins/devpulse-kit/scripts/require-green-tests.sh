#!/bin/bash
# .claude/hooks/require-green-tests.sh – Stop: agent nie kończy pracy z czerwonymi testami jednostkowymi
command -v jq >/dev/null 2>&1 || exit 0   # bez jq nie wykryjemy pętli, więc nie blokujemy

INPUT=$(cat)

# Zabezpieczenie przed pętlą: jeśli agent już raz był zatrzymany przez ten hook, odpuść
if [ "$(echo "$INPUT" | jq -r '.stop_hook_active // false')" = "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# Testy tylko wtedy, gdy w tej sesji zmienił się kod C#
if git diff --quiet HEAD -- '*.cs'; then
  exit 0
fi

if ! OUTPUT=$(dotnet test ./tests/DevPulse.Tests --filter Category=Unit 2>&1); then
  echo "Testy jednostkowe nie przechodzą. Napraw je przed zakończeniem pracy:" >&2
  echo "$OUTPUT" | tail -40 >&2
  exit 2
fi

exit 0

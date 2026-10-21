---
description: Lista kontrolna przed deploymentem DevPulse.
disable-model-invocation: true
allowed-tools: Bash(git branch *), Bash(git status *), Bash(git describe *), Bash(git log *), Bash(git diff *), Bash(dotnet test *), Bash(dotnet list *)
---

## Stan repozytorium
- Branch: !`git branch --show-current`
- Niezacommitowane zmiany: !`git status --porcelain`
- Ostatni tag: !`git describe --tags --abbrev=0`
- Ostatnie commity: !`git log --oneline -5`
- Zmiany w konfiguracji produkcyjnej: !`git diff HEAD -- src/DevPulse.Api/appsettings.Production.json`

## Testy jednostkowe
```!
dotnet test ./tests/DevPulse.Tests --filter Category=Unit 2>&1 | tail -5
```

## Podatne pakiety
!`dotnet list ./src package --vulnerable`

## Zadanie
Na podstawie powyższych danych oceń, czy projekt jest gotowy do deploymentu:
1. Deploy tylko z main lub staging.
2. Brak niezacommitowanych zmian i zmian w appsettings.Production.json.
3. Testy jednostkowe zielone, brak podatności high/critical.
4. Ostatnie commity nie zawierają "WIP", "tmp", "debug".

Format:
## Status: READY / NOT READY
### Checklist – [x] lub [ ] dla każdego punktu z krótkim uzasadnieniem
### Jeśli NOT READY – co naprawić

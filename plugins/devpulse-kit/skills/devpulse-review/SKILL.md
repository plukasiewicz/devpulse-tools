---
description: DevPulse code review – sprawdza konwencje projektu, Clean Architecture,
  async/await i testy w bieżących zmianach. Używaj przed commitem lub PR-em.
allowed-tools: Bash(git diff *), Bash(git status *)
context: fork
---

## Zmiany do przejrzenia
!`git diff HEAD`

## Zadanie
Przeprowadź code review powyższych zmian w repozytorium DevPulse.
Raportuj TYLKO rzeczywiste problemy (nie stylistykę zgodną z CLAUDE.md):

### Clean Architecture
- Czy zależności płyną we właściwym kierunku (Api → Application → Domain)?
- Czy w kontrolerach nie ma logiki biznesowej?

### Async / Await
- Czy metody z I/O kończą się Async i przekazują CancellationToken?
- Czy nie ma .Result, .Wait(), .GetAwaiter().GetResult()?

### Testy i bezpieczeństwo
- Czy nowe klasy publiczne w Application/Infrastructure mają testy?
- Czy nowe endpointy mają [Authorize], a requesty walidację FluentValidation?
- Czy nie logujemy tokenów ani innych wrażliwych danych?

Format odpowiedzi:
### Problemy wymagające naprawy
[plik:linia – problem – proponowana poprawka]
### Sugestie (nie blokują merge)
### Ocena: APPROVE / REQUEST_CHANGES

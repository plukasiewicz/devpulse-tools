---
description: Generuje kompletny endpoint REST w DevPulse – DTO, serwis, kontroler, testy.
argument-hint: [METHOD] [PATH]
disable-model-invocation: true
---

Wygeneruj kompletny endpoint REST dla DevPulse.

Metoda HTTP: $0
Ścieżka: $1

1. **Response DTO** w Application/DTOs/ – nazwa [Zasób][Akcja]Response
2. **Request DTO** (dla POST/PUT) w Application/DTOs/ – z validatorem FluentValidation
3. **Metoda w interfejsie serwisu** w Application/Interfaces/ (istniejący interfejs, jeśli pasuje)
4. **Implementacja** w Infrastructure/Services/ – obsługa błędów, logowanie, CancellationToken
5. **Endpoint w kontrolerze** w Api/Controllers/ – [Http...], [Authorize], ProducesResponseType
6. **Testy jednostkowe** w tests/DevPulse.Tests/Unit/ – happy path + minimum 2 przypadki brzegowe

Stosuj konwencje z CLAUDE.md. Nie modyfikuj Program.cs.
Na koniec uruchom testy i podaj listę utworzonych i zmienionych plików.

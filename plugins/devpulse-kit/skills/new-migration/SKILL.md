---
description: Tworzy migrację EF Core w DevPulse po sprawdzeniu encji i DbSet.
argument-hint: [NazwaMigracji]
disable-model-invocation: true
allowed-tools: Bash(dotnet ef migrations add *)
---

Stwórz migrację EF Core dla DevPulse o nazwie: $ARGUMENTS

Przed wygenerowaniem sprawdź:
1. Czy encja, której dotyczy migracja, istnieje w Domain/Entities/?
2. Czy DbSet dla tej encji jest w DevPulseDbContext.cs?
3. Czy nazwa jest w PascalCase i opisuje zmianę (AddXxx, UpdateXxx, RemoveXxx)?

Jeśli warunki są spełnione – wygeneruj migrację:
dotnet ef migrations add $ARGUMENTS --project ./src/DevPulse.Infrastructure --startup-project ./src/DevPulse.Api

Po wygenerowaniu pokaż plik migracji, sprawdź symetrię Up() i Down()
i przypomnij o dotnet ef database update (nie uruchamiaj go sam).
Jeśli encja lub DbSet nie istnieją – opisz, czego brakuje, i nie generuj migracji.

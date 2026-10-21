# devpulse-kit

Skille, subagent i hooki Claude Code dla projektów .NET + React w stylu DevPulse
(Clean Architecture, EF Core, xUnit, React/TypeScript).

## Instalacja

```
/plugin marketplace add <org>/devpulse-tools
/plugin install devpulse-kit@devpulse-tools
```

Repozytorium jest prywatne: potrzebny jest dostęp do niego przez git (`gh auth login` lub klucz SSH).
Automatyczne aktualizacje w tle wymagają tokena w zmiennej środowiskowej `GITHUB_TOKEN`.

### Wymagania

- **bash** (na Windows: Git Bash) – hooki to skrypty `.sh`
- **jq** (Windows: `winget install jqlang.jq`) – bez niego hooki ochronne blokują edycje i komendy Bash
- **.NET SDK** z `dotnet-ef` oraz **Node.js** (Prettier w `frontend/`)

## Skille

| Komenda | Opis |
|---|---|
| `/devpulse-kit:new-endpoint [METHOD] [PATH]` | Generuje endpoint REST: DTO, serwis, kontroler, testy |
| `/devpulse-kit:new-migration [NazwaMigracji]` | Tworzy migrację EF Core po sprawdzeniu encji i DbSet |
| `/devpulse-kit:pre-deploy` | Lista kontrolna przed deploymentem (stan repo, testy, podatne pakiety) |
| `/devpulse-kit:devpulse-review` | Code review bieżących zmian; Claude może go też wywołać sam przed commitem |

## Subagent

- **test-writer** – pisze testy xUnit (FluentAssertions, Moq) dla klas z Application i Infrastructure.
  Działa w osobnym worktree, na modelu Sonnet.

## Hooki

| Zdarzenie | Skrypt | Działanie |
|---|---|---|
| PreToolUse (Edit/Write) | `protect-files.sh` | Blokuje edycję `appsettings.Production.json`, `.env*` i istniejących migracji |
| PreToolUse (Bash) | `guard-commands.sh` | `dotnet ef database update` i push do `main` zawsze wymagają potwierdzenia |
| PostToolUse (Edit/Write) | `format.sh` | Formatuje zmieniony plik: `dotnet format` dla `.cs`, Prettier dla `.ts/.tsx` |
| Stop | `require-green-tests.sh` | Jeśli zmienił się kod C#, nie pozwala zakończyć pracy z czerwonymi testami jednostkowymi |

Hooki zakładają strukturę projektu DevPulse: `src/DevPulse.sln`, `tests/DevPulse.Tests`, `frontend/`.

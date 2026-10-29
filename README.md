# devpulse-tools

Marketplace pluginów [Claude Code](https://code.claude.com/docs) z serii
[Claude Code na plukasiewicz.net](https://www.plukasiewicz.net/ClaudeCode/Introduction).
Zawiera jeden plugin, **devpulse-kit**: skille, subagenta i hooki, z których korzysta projekt
[DevPulse](https://github.com/plukasiewicz/devpulse) (.NET + React).

## Instalacja

W sesji Claude Code:

```
/plugin marketplace add plukasiewicz/devpulse-tools
/plugin install devpulse-kit@devpulse-tools
```

## Co jest w środku

| Element | Opis |
|---|---|
| Skille | `new-endpoint`, `new-migration`, `pre-deploy`, `devpulse-review` |
| Subagent | `test-writer` – testy xUnit w osobnym worktree |
| Hooki | ochrona plików i komend, formatowanie po edycji, zielone testy przed końcem pracy |

Szczegóły, wymagania (bash, jq, .NET SDK, Node.js) i opis każdego hooka:
[`plugins/devpulse-kit/README.md`](plugins/devpulse-kit/README.md).

Jak powstał ten plugin i jak go używać w praktyce, opisuję w artykule
[Claude Code – własne pluginy](https://www.plukasiewicz.net/ClaudeCode/CustomPlugins).

## Licencja

[MIT](LICENSE)

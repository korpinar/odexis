# odexis

**A small director for a project you build with an AI coding tool.** You say what you want, look at the result, approve or correct it, and decide what cannot be undone. The model does the work. odexis keeps four things steady while it does.

[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

odexis is a plugin for Claude Code. It also runs in Antigravity, Codex and Cursor: see [Other tools](#other-tools).

## What it keeps steady

- **The thread.** A new conversation continues where the last one stopped.
- **Safety.** In Claude Code the tool asks you before work that others can see (sending, publishing), secret files are not read, the file tools cannot write outside the project, and with your permission every change is saved in Git and can be brought back.
- **Form.** A format you approved stays the same, on the first page and on the ninety-ninth.
- **Growth.** The project gains its own rules and skills as the need shows, and what no longer helps is pruned.

The project does not have to be code. It can be a thesis, a menu, a site, an exam or a workbook. You do not have to be a developer: setup speaks in plain words and asks three short questions.

## Quick start

You need Claude Code 2.1.323 or later, and Git. Git is a free program that runs on your computer; it is not GitHub and needs no account. If it is missing, setup writes nothing and offers to install it.

Give Claude Code the address of this repository and say "install this". With your approval it runs two commands for this project:

```text
claude plugin marketplace add https://github.com/korpinar/odexis --scope project
claude plugin install odexis@odexis --scope project
```

Then type `/odexis:setup`. If the command is not recognized yet, type `/reload-plugins`, or restart Claude Code.

Setup asks its three short questions, then tells you what it understood and what it will add, and writes only after your yes. After that you can simply say:

- "undo" to bring back the earlier state,
- "where did we leave off" in a new conversation,
- "always do it this way" to make a lasting rule,
- "update odexis" to get the newest odexis.

`/odexis:prune` proposes what can be cleaned up. `/plan`, the tool's own plan mode, is for talking something through before anything changes.

Like every plugin, odexis runs with your own permissions on your computer, and what it does can change when you update it. Read it before you install it; it is short.

## What it is

odexis is four skills and three small automatic steps. Nothing owned by odexis lives in your project. Setup writes a first form of a few files (`AGENTS.md`, two lines in `CLAUDE.md`, `odexis/status.md`, `odexis/decisions.md`, `.claude/settings.json`, and lines for secret files in `.gitignore`), with the exact lines shown when you ask for the details, and from then on they are yours. Updating odexis never touches your project's files.

| Part | Who starts it |
|---|---|
| `/odexis:setup` | You |
| `/odexis:prune` | You |
| Planning a large or unclear job | The model, when the work calls for it |
| Growing a rule, a form or a skill | The model, when a correction or a format repeats |
| One line of facts at the start of a session | The tool |
| One fact when a correction may have come twice | The tool |
| The project's rules on secret files applied to shell commands too | The tool |

## Stop or remove

Stopping and removing are in your hands. `/odexis:setup remove` shows what would go, and after your yes takes odexis's lines out of the project; your rules, records, settings and Git history stay and work without odexis. Then the plugin itself is removed:

- In the desktop app: on the plugins page (in the sidebar, "Customize" or "Plugins"), open the menu at the end of odexis's row and choose remove, not the entry that only turns it off.
- In the terminal: `/plugin uninstall odexis@odexis`. "Uninstall for everyone" removes it for the project; "Disable for me" leaves it installed.
- In another tool: that tool's own way of removing a plugin.

## Other tools

odexis is made for Claude Code. The same repository also carries a package for three other tools, with the same skills and the same project files.

| Tool | Install | What you get |
|---|---|---|
| Antigravity | `agy plugin install https://github.com/korpinar/odexis/tree/main/plugin`, then `/odexis:setup` | The skills and the automatic steps: the line of facts at the start of a session, the note when a correction may have come twice, and the rules on secret files. |
| Codex | `codex plugin marketplace add korpinar/odexis`, then `codex plugin add odexis@odexis` and `$odexis:setup` | The skills. |
| Cursor | `cursor-agent plugin marketplace add https://github.com/korpinar/odexis`, then `/plugins` to install it, and `/setup` | The skills. |

In Codex and Cursor the tool's own approvals take the place of the protections odexis sets up in Claude Code. In Antigravity the rules on secret files hold for commands and for opening a file, and its own approvals cover the rest. Setup says so in each tool. Where odexis has automatic steps (Claude Code and Antigravity), on Windows they need Git Bash, which comes with Git; in Antigravity they find it themselves and stay off where it is missing.

## Good to know

- The rules that ask before sending and that keep secret files unread catch the usual ways, not every possible one.
- odexis keeps earlier states on your computer only. It is not a backup.

## Feedback

Something did not work, or read oddly? Open an issue at [https://github.com/korpinar/odexis/issues](https://github.com/korpinar/odexis/issues) and say which tool you use, what you asked for, and what happened. See [CONTRIBUTING.md](CONTRIBUTING.md) for changes, [SECURITY.md](SECURITY.md) for a security problem, and [CHANGELOG.md](CHANGELOG.md) for what changed between releases.

## License

[MIT](LICENSE).

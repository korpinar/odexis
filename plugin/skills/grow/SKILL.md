---
name: grow
description: Decides where a new lasting rule, form or skill of the project belongs, shows it and writes it after a yes. Use when a correction comes a second time, the user approves or repeats a format, the same text is pasted a third time, or the user makes a standing request such as "always do it this way". Not for a correction seen for the first time.
---

# Growing the project's own rules

A project gains a rule when the need has shown itself: a correction seen twice, a form repeated or approved, the same text a third time, or the user's standing request. A correction seen once stays a line in the status file.

1. **Name what recurs** in one sentence. Write down only what could not be worked out from the project itself.
2. **For a recurring error**, try in this order: remove the step that causes it; make the error impossible or visible (a check, a script, a setting); a sentence that asks for care comes last.
3. **Choose where it goes.**

   | What was seen | Where it goes |
   |---|---|
   | The same correction twice; a standing request | One line in `AGENTS.md`, under "How we work" |
   | A format of an output approved or repeated | A project skill, not a line: a folder of its own with `SKILL.md`, `template.md` and `examples/` (a line cannot hold the form) |
   | The same text or procedure a third time; a job always started with the same request | A project skill, with a script beside it for a mechanical step |
   | Answers always wanted in the same form | In Claude Code an output style for the project; in another tool one line in `AGENTS.md` |
   | A runnable check exists | A project skill named `verify`; optionally an automatic step that runs it |
   | Something must hold without exception | An ask or deny rule, an automatic step, or the tool's sandbox |
   | A rule for one folder only | A rule file for that folder |
   | Side work fills the conversation | A helper; if the same job returns, a project agent |
   | Data is carried by hand from another system | That system's command-line tool first, otherwise a connection, with its cost |

   A skill, a rule file, an agent, an automatic step and an ask or deny rule go where the tool you are running in reads them, in that tool's form; write to the folders of your own tool's line only:

   - Claude Code: a skill in `.claude/skills/<name>/`, a rule file in `.claude/rules/` with a `paths` field, an agent in `.claude/agents/`, automatic steps and ask and deny rules in the settings file of Claude Code (`.claude/settings.json`), and the page list of the documentation is `https://code.claude.com/docs/llms.txt`.
   - Antigravity: a skill in `.agents/skills/<name>/`, a rule file in `.agents/rules/` with `trigger: glob` and a `globs` field, an agent in `.agents/agents/`, automatic steps in `.agents/hooks.json`, ask and deny rules in the tool's own settings (no file of the project holds them: give the user the rules to enter there, or write a line in `AGENTS.md`), and the page list is `https://antigravity.google/llms.txt`.
   - Codex: a skill in `.agents/skills/<name>/`, a rule for one folder as a line in the root `AGENTS.md` that names the folder, an agent as a TOML file in `.codex/agents/`, automatic steps in `.codex/hooks.json` and rules on commands in `.codex/rules/` (both count only in a project the user has trusted in Codex: say so), and the page list is `https://learn.chatgpt.com/docs/llms.txt`.
   - Cursor: a skill in `.agents/skills/<name>/`, a rule file in `.cursor/rules/` with the `.mdc` extension and a `globs` field, an agent in `.cursor/agents/`, automatic steps in `.cursor/hooks.json`, allow and deny rules in `.cursor/cli.json` (it has no rule that asks: say so and give a deny rule or a line in `AGENTS.md`), and the page list is `https://cursor.com/llms.txt`.

4. **Show it before writing**, in one line: its name, what it prevents, where it goes. If a rule of the user already says the opposite, say so and ask which one holds; never write a second line beside it. Then wait for a yes.

   Written without asking and reported in one line: the records (status, decisions, the map) and an improvement to the procedure of an existing project skill. The approved template and examples of a skill are changed only by the user.
5. **Write it after the yes.**
   - A line in `AGENTS.md` says what to do, with the reason in a few words; a prohibition says what to do instead.
   - Before writing a skill, an agent, a rule file, a setting, an automatic step or (in Claude Code) an output style, read the current page for it in the documentation of the tool you are running in (step 3 has its page list).
   - A project skill: give it a `name` and a third-person `description` that says what it does and when to use it. Instructions in English; template and examples in the language of the output. The first approved output is the first example; keep three to five at most. If a skill with that name exists, show it and ask instead of overwriting. Add `- <job>: use the \`<name>\` skill.` to `AGENTS.md`, then try the skill once with the request that led to it.
   - A setting, an automatic step or (in Claude Code) an output style: the file is the user's to edit. Give the exact lines, in this tool's form, and the file they go into. In Claude Code on Windows, a `Bash` deny rule also turns the PowerShell tool off unless a `PowerShell` rule is added with it; say so.
   - A lesson, meaning why something went wrong and how it is checked now: its own file `odexis/lessons/<date>-<topic>.md` (summary, why, the name of the check) and one line under "Lessons" in `odexis/decisions.md`, in place of a `(none)` line.
6. **Close.** Delete the line from "Corrections" in the status file once it has become a rule. Report in one line what was written and where.

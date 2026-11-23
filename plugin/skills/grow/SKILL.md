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
   | A format of an output approved or repeated | A project skill, not a line: `.claude/skills/<name>/` with `SKILL.md`, `template.md` and `examples/` (a line cannot hold the form) |
   | The same text or procedure a third time; a job always started with the same request | A project skill, with a script beside it for a mechanical step |
   | Answers always wanted in the same form | An output style for the project |
   | A runnable check exists | A project skill named `verify`; optionally an automatic step that runs it |
   | Something must hold without exception | An ask or deny rule, an automatic step, or the tool's sandbox |
   | A rule for one folder only | A rule file in `.claude/rules/` with a `paths` field |
   | Side work fills the conversation | A helper; if the same job returns, a project agent in `.claude/agents/` |
   | Data is carried by hand from another system | That system's command-line tool first, otherwise a connection, with its cost |

4. **Show it before writing**, in one line: its name, what it prevents, where it goes. If a rule of the user already says the opposite, say so and ask which one holds; never write a second line beside it. Then wait for a yes.

   Written without asking and reported in one line: the records (status, decisions, the map) and an improvement to the procedure of an existing project skill. The approved template and examples of a skill are changed only by the user.
5. **Write it after the yes.**
   - A line in `AGENTS.md` says what to do, with the reason in a few words; a prohibition says what to do instead.
   - Before writing a skill, an agent, an output style, a rule file or an automatic step, read the current page for it in the tool's documentation (the page list is `https://code.claude.com/docs/llms.txt`; skills are at `https://code.claude.com/docs/en/skills.md`).
   - A project skill: give it a `name` and a third-person `description` that says what it does and when to use it. Instructions in English; template and examples in the language of the output. The first approved output is the first example; keep three to five at most. If a skill with that name exists, show it and ask instead of overwriting. Add `- <job>: use the \`<name>\` skill.` to `AGENTS.md`, then try the skill once with the request that led to it.
   - A setting, an output style or an automatic step: the settings file is the user's to edit. Give the exact lines and the file they go into. On Windows, a `Bash` deny rule also turns the PowerShell tool off unless a `PowerShell` rule is added with it; say so.
   - A lesson, meaning why something went wrong and how it is checked now: its own file `odexis/lessons/<date>-<topic>.md` (summary, why, the name of the check) and one line under "Lessons" in `odexis/decisions.md`, in place of a `(none)` line.
6. **Close.** Delete the line from "Corrections" in the status file once it has become a rule. Report in one line what was written and where.

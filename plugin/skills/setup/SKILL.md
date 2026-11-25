---
name: setup
description: Sets up odexis in this project, adds only what is missing when run again, or removes odexis's lines when called with "remove". Started only by the user.
disable-model-invocation: true
argument-hint: "[remove]"
---

# odexis setup

Arguments: `$ARGUMENTS`

If the arguments ask for removal ("remove", or the same word in the user's language), follow [remove.md](remove.md) and nothing below.

Setup writes the project's first form once. What it writes belongs to the project from then on. It never overwrites: an existing file keeps its content, and a second run adds only what is missing. Write every message to the user in plain words and in the conversation language: the "Language" line of the start file if there is one, otherwise the language the user writes in; when their message is only this command, the language the project's files are written in.

## 1. Look

In this order:

1. Read what exists: `AGENTS.md`, `CLAUDE.md`, `.claude/settings.json`, `odexis/`, a README, older instruction files, and enough of the project to say in two sentences what it is and where each kind of output goes. If the folder is empty or unclear, ask what the project is for.
2. Find the project's check command if it has one (tests, a build, a linter). If it has none, leave the "Check" line out of the start file.
3. Run `git --version`. If Git is not installed, write no file and stop. Tell the user in the conversation language that odexis needs Git to keep earlier states of the files, so that a change can be brought back; that Git is a free program that runs on this computer, is not GitHub, needs no account and sends nothing anywhere; and offer to install it with their yes. On Windows odexis's automatic steps need Git Bash, which comes with Git for Windows.

## 2. Ask, show, wait

The user may not be a developer. Everything they read in this step is in plain words and in the conversation language.

**Ask the preferences first.** Each is its own question; one the project's files already record is not asked.

1. The conversation language: propose the one chosen by the rule above.
2. Saving: should the work be saved at the end of each piece, so that an earlier state can be brought back? Three answers: yes, with what the user changes by hand saved separately (commit answer `yes`, manual answer `yes`); yes (`yes`, `no`); no (`no`, `no`).
3. Should answers be short in this project? In Claude Code, if the user has a personal style, say that the project's choice would replace it here.

When the tool offers a question window (a tool of its own for questions with options: AskUserQuestion in Claude Code, AskQuestion in Cursor, ask_question in Antigravity, request_user_input in Codex), ask them there, all in one window, each with two or more options and your proposal as the first, in the same plain words as the message below, and write no text before it: the window shows only its own questions, and text written just before it may never reach the user. A clash that needs the user's answer (below) is one more question in the window, worded so that it can be answered by itself. Where the tool offers no window, ask nothing yet: the questions go into the message as a numbered list after the form (on a second run, after what is missing), a clash question first, each answerable in a word; the question whether to write is the last item of that list.

**Then show the message and ask whether to write.** The message is the last text of your reply and ends with the question whether to write now. On a second run, where odexis's files are already there, it is only what is missing, in the same plain words. Otherwise it is the form below, with nothing before the form. The message names no file, folder, command or setting of odexis, Git or the tool, and has none of the words "commit", "repository", "push" and "pull request": it says what happens instead. The project's own files keep the names the user gave them. Translate the lines outside brackets as they stand and add no line of your own to the form; a bracket that starts with "only if" is a condition: leave it out of the message, and when it does not hold leave out everything from it to the next blank line or list item; any other bracket is filled in.

```markdown
**What I understood**
[Two sentences: what the project is.] [Which kind of work is kept where.]

**What I will add**
- A short page of rules for working on this project, and a notebook that carries where we left off into the next conversation.
- [only if the project has none yet] A short list that keeps the usual files for passwords and keys out of what is saved.
- [only if older instructions exist] [What is taken over from them into the page of rules.] One that is no longer needed is removed only if you say so.
- [only if something that exists gets new lines] [What is added, one plain line each.]
- [only if the folder keeps no history yet] From now on the folder can keep earlier states of its files, on this computer only.
- Nothing that exists is overwritten or deleted.

**What protects you**
- Before work is sent where others can see it, or published, you are asked first. This catches the usual ways of sending, not every possible one.
- The usual files for passwords and keys are not read and stay out of what is saved. A file of that kind with an unusual name or place is not covered.
- Writing outside this project's folder is blocked. This too catches the usual ways of writing a file, not every possible one.
- [only if the tool's sandbox works on this system] There is one more layer of protection you can turn on.

[only if there is a clash] **Where your own settings differ**
[One line for each clash.]

Say "details" to see the names of the files and the exact lines.
```

- Clashes: if the user's settings already allow something they would be asked about, say that odexis's line would make it ask again and let the user drop that line. If the project's settings for Claude Code already set a language or an output style, that value stays; say the difference. If a rule of the user says the opposite of a line you would write, ask which holds; do not write a line against the user's rule.
- In a tool other than Claude Code: the same files are written, so the project's rules, records and settings are ready when it is opened in Claude Code, but the settings file is Claude Code's and this tool does not enforce it. Under "What protects you", in Antigravity keep the line on the files for passwords and keys, which odexis's own step applies there, say that it holds for commands and for opening a file, not for a search, and write one line in place of the other two: being asked before work is sent and the block on writing outside the folder are enforced by Claude Code; in this tool its own approvals protect the user. In any other tool write that one line in place of all three, with keeping the files for passwords and keys unread named in it as the third thing Claude Code enforces. Leave the line on one more layer out. In the start file's line on the two commands only the user starts, write them the way this tool starts them (step 4 has the forms; setup itself is `/setup` in Cursor and `$odexis:setup` in Codex). In step 3, also on a second run, add this line to the "Records" section of `AGENTS.md`, after the line on the status file, if it is not there, and name it in the message with one plain line under "What I will add" (a line in the page of rules, so that the notebook is read and kept current in this tool): `- If the status file is not in front of you at the start of a conversation (a tool that does not load it): read it before a piece of work, and when the work is done write where things stand under "Where we left off".`
  In a tool other than Claude Code, with a yes to short answers (given now, or recorded as the Concise output style in the project's settings for Claude Code), in step 3, also on a second run, add this line to "How we work" in `AGENTS.md` if it is not there (this tool has no setting for it), and name it in the message with one plain line under "What I will add": `- Answers are short: the result first, then only what the user must check or decide.`
  When setup writes the start file in Codex, Antigravity or Cursor, or adds the `## odexis` section to one that exists, its line on "update odexis" is this tool's line below, in place of the template's; a line on "update odexis" that is already there is kept, and when it gives another tool's way, this tool's line is added after it, also on a second run, with the tool named (`- "update odexis" in Codex: …`).

  ```markdown
  Codex:
  - "update odexis": Codex updates odexis by itself when it is started: suggest closing Codex and opening it again; if the copy is still the old one, run `codex plugin marketplace upgrade odexis`.
  Antigravity:
  - "update odexis": run `agy plugin install` again with the address odexis was installed from (ask the user for it if you do not know it) and suggest a new conversation.
  Cursor:
  - "update odexis": read odexis's address from `cursor-agent plugin marketplace list`, run `cursor-agent plugin marketplace remove odexis` and then `cursor-agent plugin marketplace add` with that address, and ask the user to install odexis again from `/plugins` in a new conversation.
  ```
- Details, when asked: each file you will create and, for each file that exists, exactly what you will add to it, including the lines `.env`, `.env.*` and `secrets/` in `.gitignore`; the `ask` and `deny` rules of [templates/settings.template.json](templates/settings.template.json); the Git steps of step 3.

An answer counts only for the question it was given to; a decision without an answer is asked again, never assumed. Write nothing until the user has said yes to writing. Their yes covers what the message showed.

## 3. Write

Fill the templates in [templates/](templates/) and write only the files that do not exist, with the file tools and not through a shell command:

| Template | Written to |
|---|---|
| `agents.template.md` | `AGENTS.md` |
| `claude.template.md` | `CLAUDE.md` |
| `status.template.md` | `odexis/status.md` |
| `decisions.template.md` | `odexis/decisions.md` |
| `settings.template.json` | `.claude/settings.json` |

- Placeholders: `{{PROJECT_NAME}}`, `{{PROJECT_DESCRIPTION}}`, `{{MAP_LINES}}` (one `- \`path\`: what goes there` line per place), `{{CHECK_COMMAND}}`, `{{LANGUAGE}}` (the language's English name), `{{COMMIT_ANSWER}}` and `{{MANUAL_ANSWER}}` (`yes` or `no`), `{{DATE}}` (today, YYYY-MM-DD), `{{MODEL}}` (your exact model ID as the tool gives it: the full ID, not a display name).
- Keep every other line of a template as it is.
- Project knowledge found in older instruction files is taken into `AGENTS.md`.
- `AGENTS.md` exists: keep it; add the sections of the template it lacks.
- `CLAUDE.md` exists: keep its content and add the two loading lines at its top if they are missing.
- `odexis/status.md` exists: keep its content; add the `odexis_` fields it lacks to the header block at its very top (inside the block if there is one, otherwise as a new block), and the sections it lacks.
- `.gitignore`: create it with the lines `.env`, `.env.*` and `secrets/`, or add to an existing one the lines it lacks. This does not depend on the commit answer.
- `.claude/settings.json` exists: add the missing keys and list entries; never replace a value.
- On macOS and Linux leave the `PowerShell(...)` lines out of the settings.
- If the tool refuses a write to a settings file (it does once the outside-write block is on), give the user the exact lines to add and the file.
- Without a yes to short answers, leave `outputStyle` (the built-in Concise style of Claude Code) out.
- If the folder is not a Git repository, run `git init`. If Git has no name and email here, set `git config user.name "Project"` and `git config user.email "project@localhost"` for this repository only.
- If the commit answer is yes, make the first commit: the files setup wrote and, in a repository without commits, the project's existing files. Secret files stay out of it.
- In `odexis/status.md`, `odexis_files` stays as the template has it: the five files a set-up project has.

## 4. Hand over

The reply after the writing is the form below and nothing else: no list of the files written and no account of the Git steps. Every word of it is in the user's language. In the card a bracket stands for what the user will say: in its place write, in quotes, the words a user would say for it in their language, not the bracket's own English. The two commands are written the way this tool starts them: as below in Claude Code and Antigravity; `/prune` and `/setup remove` in Cursor; `$odexis:prune` and `$odexis:setup remove` in Codex.

```markdown
[One sentence: odexis is set up in this project.] [only if something could not be written or saved] [What, and what the user can do about it.]

**What you can say from now on**
- [undo] brings back the earlier state.
- [where did we leave off] in a new conversation continues from the status file.
- [always do it this way] makes a lasting rule.
- [update odexis] updates odexis; the project's files are not touched.
- [report this to odexis] prepares a report of something of odexis that did not work; you see it first and send it yourself.
- `/odexis:prune` proposes what can be cleaned up.
- `/odexis:setup remove` takes odexis's lines out of the project.
- `/plan` (the tool's own plan mode) is for talking something through before anything changes.
```

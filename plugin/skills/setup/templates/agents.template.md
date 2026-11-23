# {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

## Map

Where each kind of output goes. A folder that fits is used without asking; for a new purpose, propose the place once and add its line here.

{{MAP_LINES}}

## How we work

- Language: talk to the user and write the project's outputs in {{LANGUAGE}}.
- The records (`odexis/`, this file, skills) are written in English, also when the conversation is in another language; the user's own words go in as said, in quotes. Folders and record files you create get names in plain English letters.
- Check: `{{CHECK_COMMAND}}`.
- Commits: at the end of each piece of work, commit the changes to Git: {{COMMIT_ANSWER}}. Changes the user made by hand are committed separately, before your first change: {{MANUAL_ANSWER}}. Commit only the files you changed, by name. Where the answer is no, commit only when the user asks.
- When you tell the user that work was saved, say it in plain words: no commit hash and no Git warning unless they ask.
- A reported bug: first build the check that shows it and see it fail, then fix it and see it pass; report both. If no check can be built, say so.
- A tool or service the project needs is proposed when it is needed, with what it costs: the price from its own page, a cheaper option beside it, and what leaves this computer.
- When you call a piece of work done: say what the user can open to see the result and what they should see there (where there is nothing to open, what your own check showed), and what you did not try.
- A report you compile from sources for the user to decide on (counts, claims): before you tell the user what it says, have a new subagent (not a fork: one that has not seen this conversation) compare the report with its sources, in one round; tell it to report only what is wrong or not in the sources, not style. Until its answer is back, tell the user nothing of the report's content. Then fix what you confirm in the sources, and tell the user in a sentence what the comparison found.

## Records

- `odexis/status.md` (loaded in every session): where we left off, the open work with a done criterion each, and corrections seen once. Keep it current as the work moves; delete finished work, Git keeps it.
- `odexis/decisions.md`: one row per decision (date, decision, why, status), written when the user chooses between options or settles something later work must follow. A decision is never deleted; its status changes. Search it when needed.
- `odexis/lessons/`: one file per lesson, listed in `odexis/decisions.md`.
- A first correction from the user goes into "Corrections" in the status file as one line: `- <date>: <what to do, in the user's words>`.
- Project knowledge goes into these files, not into the tool's own memory.

## odexis

- Large or unclear work (several parts or steps, or the user does not know where to start): use the `odexis:plan` skill before answering.
- A correction that comes a second time, a format the user approves or repeats, the same text pasted a third time, or a standing request ("always do it this way"): use the `odexis:grow` skill.
- `/odexis:setup` and `/odexis:prune` are started only by the user; when asked for them in words, name the command.
- A session-start line that says something is worth telling the user: tell them once in the conversation, with the command it names.
- "update odexis": run `claude plugin update odexis@odexis --scope project` and suggest a new conversation.

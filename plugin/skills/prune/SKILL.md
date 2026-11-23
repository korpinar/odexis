---
name: prune
description: Proposes in one list, with reasons, what the project no longer needs (rules, skills, lessons, files, records grown too large) and removes it after one yes. Started only by the user.
disable-model-invocation: true
---

# Pruning

Rules must not pile up. Nothing is removed before the user's yes, and a decision is never deleted. Write every message to the user in the conversation language (the "Language" line of the start file), also when their message is only this command.

1. **Look.** If you can start the tool's own audits (`/doctor`, `/doctor prompt-audit`, `/skill-doctor`), use them; if not, name them for the user to run and read the files yourself: `AGENTS.md`, `odexis/`, `.claude/skills/`, `.claude/agents/`, `.claude/rules/`, the project's automatic steps and its ask and deny rules.
2. **Collect the candidates**, each with its reason:
   - a line in `AGENTS.md` that points to something that no longer exists, repeats what the project itself shows, was written for a weakness of an earlier model, or is no longer followed by the work;
   - a project skill whose job is gone. After a model change: a skill written to make up for a model's weakness is a candidate; a skill that carries a preference or a form stays;
   - a lesson or a file that is out of date;
   - an automatic step that only holds a preference, or a check that stops the work without need;
   - a line in "Corrections" that never came back;
   - a record grown too large: propose splitting `odexis/decisions.md` by year once it passes about 200 rows.

   Compare the start file's lines with setup's current lines in `${CLAUDE_PLUGIN_ROOT}/skills/setup/templates/agents.template.md` and propose the differences worth taking; never overwrite the project's lines.
3. **Show one list**: what, why, and what will happen to it (delete, shorten, split, change status). Leave no choice open inside the list: decide each entry yourself, so that one yes settles the whole list. A line that tells to use something that is not there and that no work will create, such as a script that does not exist, is not kept as it is: it is deleted, or reworded to what exists. A place that later work fills, such as a folder of the map or `odexis/lessons/`, is not such a line. The tool's own memory is not touched; say that old instructions may also remain there and that `/memory` shows them.
4. **If the project does not commit at the end of each piece of work**, ask for one Git commit before deleting. If the user declines, say that what is deleted cannot be brought back.
5. **After the yes**, apply the whole list. A decision's row stays and its status changes. What must leave the settings file (an ask or deny rule, an automatic step) is prepared for the user to remove: the exact lines and the file.
6. **Close.** Read `odexis/status.md`. Its header is the block between the two `---` lines at the very top; an import does not show it. There, replace the value of `odexis_pruned` with today's date and the value of `odexis_model` with your exact model ID as the tool gives it (the full ID, not a display name). Add no second copy of a field. Commit if the project's commit answer is yes. Report in one line what was removed.

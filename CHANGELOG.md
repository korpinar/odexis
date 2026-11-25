# Changelog

What changed for someone who uses odexis, newest first: what is new, then what was fixed, then anything you need to do. The numbers and dates are those of the releases on this repository's page.

## 1.0.7 (2026-11-25)

### New

- "Report this to odexis": say it when something of odexis did not work. The model writes the report from the conversation, takes out names, e-mail addresses, phone numbers, folder paths and keys, shows you the exact text, and after your yes gives a link that opens the filled report form. It sends nothing itself.
- A plan shows apart the larger choices the model made itself, one line each with its reason, so that they are not taken for something you decided.
- Codex updates odexis by itself when its interactive program is started and a new release is out. The README and the page of rules of a project set up there now say so; before, they gave a command to type.

### Fixed

- In Claude Code on Windows without Git Bash, odexis's three automatic steps no longer end in an error. There the tool runs a step in PowerShell, where it failed each time, and by the tool's own rule for such a computer a step that fails before a command can block that command. The steps now stay off there and the tool works as it does without them.
- In Antigravity on Windows the launcher of the steps takes `where` and `git` from the system's path only, never from the folder it is started in, and looks into a per-user folder only when Windows names one.

## 1.0.6 (2026-11-25)

### New

- This repository's page shows odexis at work: a picture and a before/after example, in the words of real sessions.

### Fixed

- In Claude Code a reply at the start of a conversation no longer ends with a needless note about pruning. Session start named the model at the last prune and left the comparison to the model, which passed it on in many replies although nothing had changed. The model at the last prune is now named only where the tool gives this session's model; a prune older than three months is still said.

## 1.0.5 (2026-11-24)

### New

- In Antigravity, Codex and Cursor, a rule, skill or helper the project gains ("always do it this way") is written where that tool reads it. Before, it went into Claude Code's folders, where the other tool might never read it.
- A yes to short answers at setup has an effect in those three tools too: it becomes a line in the page of rules. Before, it had none there.
- Pruning looks in each tool's folders and proposes a copy for what lies where your tool does not read it.

### Fixed

- Removal names each tool's own way of taking the plugin out, and says when the project still turns odexis on for Claude Code.

### What you need to do

- If your project gained a rule or skill in Antigravity, Codex or Cursor before this release, it went into Claude Code's folders. Start pruning once: it proposes the copy.

## 1.0.4 (2026-11-24)

### New

- "update odexis" works in Codex, Antigravity and Cursor: a project set up there gets that tool's own way of updating in its page of rules. Before, it got Claude Code's command.

### Fixed

- Pruning and removal in Antigravity, Codex or Cursor no longer suggest commands that only Claude Code has, such as `/doctor`.
- Setup's closing reply is short and ends with the card of what you can say from now on. With a small model the card was sometimes cut short or missing, behind a long account of the files written.

### What you need to do

- A project set up in one of those tools before this release keeps Claude Code's update command in its page of rules. The README's section on other tools has each tool's way.

## 1.0.3 (2026-11-23)

### Fixed

- Setup's closing card no longer keeps some of its phrases in English in a conversation in another language. This showed in Cursor.
- Setup's message has a line of its own for the list that keeps the usual files for passwords and keys out of what is saved, and no longer names such a file.

## 1.0.2 (2026-11-23)

### New

- In Antigravity the automatic steps, taken out in 1.0.1, are back and work on Windows in any terminal. They find the Git Bash that comes with Git themselves, and where they cannot they stay off without disturbing the tool.
- In Antigravity odexis's commands are listed by their short names.
- Setup and planning use the tool's own question window in the other tools too, where there is one.

### Fixed

- Setup's closing card is in your language throughout and names the commands the way your tool starts them.

### What you need to do

- In Antigravity the install address now ends in `/tree/main/plugin`. If you installed odexis there before, uninstall it and install it from that address.

## 1.0.1 (2026-11-23)

### Fixed

- In Antigravity on Windows the automatic steps could stop the tool's own work. They are no longer installed there; Antigravity gets the skills, as Codex and Cursor do.

## 1.0.0 (2026-11-23)

### New

- The project's rules on files that are not to be read hold for shell commands too.
- A report compiled from sources for you to decide on is checked against its sources before you are told what it says.
- odexis also runs in Antigravity, Codex and Cursor.
- A change log, pages on contributing and on security, and templates for issues and pull requests.

### Changed

- Setup asks its questions first and shows what it will add after, in plain words.
- Removal is told in plain words, with the desktop app's way beside the typed command.
- Saved and finished work is told in plain words, with what you can open to see the result.
- In a tool other than Claude Code, setup names that tool's own approvals in place of the protections that only Claude Code enforces.

## Before 1.0.0

- First version: four skills (setup, plan, grow, prune) and two automatic steps.

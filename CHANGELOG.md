# Changelog

What changed for someone who uses odexis, newest first. The numbers are those of the releases on this repository's page.

## 1.0.4

### Fixed

- A project set up in Codex, Antigravity or Cursor gets that tool's own way of updating odexis in its page of rules; before, it got Claude Code's command. A project set up earlier keeps its line; the README's section on other tools has each tool's way.
- Pruning and removal in Antigravity, Codex or Cursor no longer suggest commands that only Claude Code has, such as `/doctor`.
- Setup's closing reply is short and ends with the card of what you can say from now on; with a small model the card was sometimes cut short or missing, behind a long account of the files written.

## 1.0.3

### Fixed

- Setup's closing card no longer keeps some of its phrases in English in a conversation in another language; this showed in Cursor.
- Setup's message has a line of its own for the list that keeps the usual files for passwords and keys out of what is saved, and no longer names such a file.

## 1.0.2

### Fixed

- In Antigravity the automatic steps are back and work on Windows in any terminal: they find the Git Bash that comes with Git themselves, and where they cannot they stay off without disturbing the tool.
- In Antigravity odexis's commands are listed by their short names. Its install address now ends in `/tree/main/plugin`; if you installed it before, uninstall it and install it from that address.
- Setup's closing card is in your language throughout and names the commands the way your tool starts them.
- Setup and planning use the tool's own question window in the other tools too, where there is one.

## 1.0.1

### Fixed

- In Antigravity on Windows the automatic steps could stop the tool's own work. They are no longer installed there; Antigravity gets the skills, as Codex and Cursor do.

## 1.0.0

### Added

- The project's rules on files that are not to be read now hold for shell commands too.
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

# Security

## What odexis runs on your computer

odexis is text for the model (four skills) and three short Bash scripts in `plugin/hooks/`. The scripts read the project's own files and the input the tool hands them, write and tidy only small notes of their own in the tool's data folder for the plugin, and make no network connection. Nothing of odexis is copied into your project except the files setup writes after your yes.

Like every plugin, odexis runs with your own permissions. Read it before you install it; it is short.

## What its protections are, and are not

The rules setup writes (being asked before work is sent, secret files kept unread, the block on writing outside the project) catch the usual ways of doing these things. They are not a security boundary: a command that reaches a secret file without naming it is not caught, and in tools other than Claude Code most of these rules are not enforced at all. The README says per tool what holds.

## Reporting a problem

If you find a way in which odexis itself exposes a secret, runs something it should not, or writes where it should not, please report it privately: on the repository's page open "Security", then "Report a vulnerability". Say which tool and version you use and how to see the problem. Please do not open a public issue for it.

Only the newest release is fixed.

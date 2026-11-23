---
name: plan
description: Turns a large or unclear request into a short interview and one plan the user approves before anything is changed. Use when the work is large, spans several steps or conversations, or the user does not know where to start. Not for a small, clear request.
---

# Planning a large or unclear piece of work

The plan is the one approval for this work. Until the user approves it, change no file.

1. **Understand.** Look at the project and at what the user gave. In prose, in the user's language, say what you understood they want, in their words. If they gave an example, say the idea you took from it.
2. **Ask the decisions.** Ask only what changes the result for the user: what it must do, what is left out, limits only they know, cost. How it is built is yours to decide. Use the question window (the AskUserQuestion tool) when the tool offers it, otherwise a short numbered list. Every question has an option that means "I don't know, you decide"; when it is chosen, apply your own recommendation and say which. If the user closes the window or answers in prose, go on in prose and take that as the answer. Ask two to four questions, then say what was decided.
3. **Show the plan.**
   - The expected result, in the user's words.
   - The done criterion: something that can be checked, such as a command, a format rule or a number a script produces.
   - The items in order, each with its own short done criterion. For a large project: the list of stages, and the items of the first stage only.
   - The decisions taken in the interview, one line each.

   End by asking for the approval.
4. **After the approval.**
   - Write the plan into "Open work" in `odexis/status.md`: one line for the expected result, then the items as `- [ ] <item>. Done: <criterion>.`, in place of a `(none)` line. There is no separate plan file.
   - Write the decisions taken into `odexis/decisions.md`.
   - Suggest a new conversation for the build; the status file carries the plan there.
5. **As the work moves.** Check each finished item against its criterion, then delete it from the status file. When a stage ends, write the next stage's items and tell the user; a new approval is needed only if the expected result changes.

---
name: report
description: Prepares a report to the makers of odexis about something of odexis that did not work or is missing, from what happened in this conversation; shows its exact text and after a yes gives a filled link to open; sends nothing itself. Use when the user asks to tell, report or pass on to odexis something that went wrong or that they miss, such as "report this to odexis". Not for a fault in the user's own project, and not for a report about the user's own work.
---

# Reporting something to the makers of odexis

What leaves this computer is the user's decision. This skill prepares the report and hands it over; it sends nothing: no command, tool or request that reaches GitHub or any other service.

1. **Gather** from this conversation only; open no session record and no other file for it. Ask one short question only when one of these cannot be told from the conversation.
   - The tool this session runs in, and the system if you know it.
   - What the user asked for: their message, as they wrote it.
   - What happened.
   - What they expected.

   If what went wrong is not odexis's (the user's own files, the tool itself, another plugin), say so in one sentence and go on only if the user still wants the report. odexis is its skills (setup, plan, grow, prune, report), its line at the start of a conversation, its refusal of a shell command that names a file the project keeps from being read, and the files setup wrote.
2. **Take out what is personal.** Names of people and businesses, e-mail addresses, phone numbers, the paths of folders (a file's own name stays where the fault needs it), passwords, keys and tokens, anything from a file the project keeps from being read, and whatever of the user's work the fault does not need. Put a word in square brackets in its place, such as `[name]` or `[folder]`.
3. **Show the exact text**, in the user's language, as a form, and ask whether it may be prepared for sending:

   ```
   [a title of one line]
   [label: the tool]: [the tool, its version and the system, as far as known]
   [label: what I asked for]: [the user's message, with what is personal taken out]
   [label: what happened, and what I expected]: [both, in two or three sentences]
   ```

   A bracket that begins with "label" stands for those words said in the user's language; every other bracket is filled in.

   Say under it what was taken out, by kind, in one sentence. Change the text as the user asks and show it again.
4. **After the yes, give the link.** It opens the report form of odexis's page with the text filled in:

   `https://github.com/korpinar/odexis/issues/new?template=report.yml&title=[title]&version=[tool]&asked=[asked]&happened=[happened]`

   Each value is the text shown in step 3 after its label, percent-encoded. Encode it with a command, not by hand (an encoding done by hand goes wrong with letters outside English). If no command can be run, or the link is longer than 6,000 characters, give `https://github.com/korpinar/odexis/issues/new?template=report.yml` and the text again, to paste into the form.

   Say with it, in plain words: the link opens a filled form on GitHub, the site where odexis is kept; a free account there is needed; the tool is chosen from the list at the top of the form; nothing is sent until they press the button that creates the report, and until then they can change every word; if the form opens empty, the text above is pasted into it.

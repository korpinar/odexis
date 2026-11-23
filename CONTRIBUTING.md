# Contributing to odexis

Thank you for looking. odexis is small on purpose, and it stays useful only if it stays small.

## Reporting something

Open an issue. The form asks for the three things that make a report usable: which tool you use, what you asked for, and what happened. Your own words are enough; you do not need to know why it happened.

For a security problem, see [SECURITY.md](SECURITY.md) and do not open a public issue.

## Proposing a change

Open an issue first and say what did not work for you. A change starts from something that was seen to go wrong.

- Keep a pull request to one change.
- Before adding a sentence, look in the same place for one to delete or replace.
- Use plain English, and no tool or project names in examples.
- Say what you changed and how you saw that it works.

## Checks to run

```text
claude plugin validate .
claude plugin validate plugin
```

The validators warn that Claude Code's manifest has no version. That is meant: Claude Code then treats every published change as an update.

`plugin/` is the package. The other manifests, in the folders at the top level and in `plugin/`, are what the other tools read; they point at the same skills.

By contributing you agree that your contribution is licensed under the [MIT License](LICENSE).

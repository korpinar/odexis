#!/bin/bash
# odexis, before a shell command (on Antigravity also before a file is read): applies the project's own Read(...) deny rules to the whole
# command text. The tool applies them to the file commands it can analyze; a loop or a script
# that names the file elsewhere in the command is not covered there. A rule the user takes out
# of the project's settings is gone here too. Silent when no rule names anything in the command.
input="$(cat)"
# Claude Code names the project in the environment; Antigravity gives it in the input
# (its own input is marked by "hookEventName") and runs the step from the plugin's folder.
agy=0; case "$input" in *'"hookEventName"'*) agy=1 ;; esac
proj="$CLAUDE_PROJECT_DIR"
if [ -z "$proj" ]; then
  proj="$(printf '%s' "$input" | sed -n 's/.*"workspacePaths"[[:space:]]*:[[:space:]]*\[[[:space:]]*"\([^"]*\)".*/\1/p' | head -n 1)"
  [ -n "$proj" ] || proj="$(printf '%s' "$input" | sed -n 's/.*"cwd"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p' | head -n 1)"
  proj="${proj//\\\\//}"
fi
proj="${proj:-$PWD}"
[ -f "$proj/.claude/settings.json" ] || [ -f "$proj/.claude/settings.local.json" ] || exit 0
rules="$(cat "$proj/.claude/settings.json" "$proj/.claude/settings.local.json" 2>/dev/null | tr -d '\r\n' |
  grep -o -E '"deny"[[:space:]]*:[[:space:]]*\[([[:space:]]*"(\\.|[^"\\])*"[[:space:]]*,?)*' | grep -o '"Read([^"]*)"')"
[ -n "$rules" ] || exit 0
if [ "$agy" = 1 ]; then  # Antigravity: the tool call's arguments (a command line, or the path of a file to read)
  cmd="$(printf '%s' "$input" | tr -d '\r\n' | sed -n -E 's/.*"toolCall"[[:space:]]*:[[:space:]]*\{.*"args"[[:space:]]*:[[:space:]]*\{(("(\\.|[^"\\])*"|[^{}"])*)\}.*/\1/p')"
else
  cmd="$(printf '%s' "$input" | tr -d '\r\n' | sed -n -E 's/.*"command"[[:space:]]*:[[:space:]]*"((\\.|[^"\\])*)".*/\1/p')"
fi
# Arguments in a form not foreseen: the tool call whole, up to the input's next field.
[ -z "$cmd" ] && [ "$agy" = 1 ] && case "$input" in *'"toolCall"'*) cmd="${input#*\"toolCall\"}"; cmd="${cmd%%,\"transcriptPath\"*}" ;; esac
[ -n "$cmd" ] || exit 0
# The command as typed, near enough: a backslash becomes a slash (Windows paths), escapes become text.
cmd="${cmd//\\\\//}"; cmd="${cmd//\\n/ }"; cmd="${cmd//\\t/ }"; cmd="${cmd//\\\"/\"}"

W='[^[:space:]/"'\'';|&<>()]'   # one character of a file name
N='[^A-Za-z0-9_.-]'             # a character that cannot continue a file name
shopt -s nocasematch
lit() { # text -> the same text as a regular expression
  local t="$1" o="" ch k=0
  while [ "$k" -lt "${#t}" ]; do
    ch="${t:k:1}"
    case "$ch" in '.' | '+' | '*' | '?' | '(' | ')' | '[' | ']' | '{' | '}' | '^' | '$' | '|') o="$o[$ch]" ;; '\') ;; *) o="$o$ch" ;; esac
    k=$((k + 1))
  done
  o="${o//\[^\]/\\^}"; printf '%s' "$o"
}
while IFS= read -r rule; do
  pat="${rule#\"Read(}"; pat="${pat%)\"}"; pat="${pat//\\\\//}"   # a backslash in a rule is a slash
  pre=""
  case "$pat" in
    '~/'*)   # from the home folder: as typed, or the folder's own path
      p="${pat#\~/}"; pre="~|[$]HOME|[$][{]HOME[}]|[$]env:USERPROFILE|[$]USERPROFILE|%USERPROFILE%"
      if [ -n "$HOME" ]; then h="$(lit "${HOME//\\//}")"; pre="$pre|$h|[A-Za-z]:${h#/[A-Za-z]}"; fi
      pre="($pre)/" ;;
    '~' | '//' | '//'[A-Za-z]) continue ;;
    '//'[A-Za-z]'/'*)   # from a drive: /c/... or C:/...
      p="${pat#//?/}"; d="${pat:2:1}"; pre="(/$d|$d:)/" ;;
    './'*) p="${pat#./}" ;;
    *) p="$pat" ;;
  esac
  while [ "${p#/}" != "$p" ]; do p="${p#/}"; done
  case "$p" in *[A-Za-z0-9]*) ;; *) continue ;; esac   # a rule for everything names no file
  end="(\$|$N)"
  case "$p" in *'/**') p="${p%\*\*}"; end="" ;; esac   # everything under a folder
  re=""; i=0
  while [ "$i" -lt "${#p}" ]; do
    c="${p:i:1}"
    case "$c" in
      '*')
        if [ "${p:i:3}" = '**/' ]; then re="$re([^[:space:]]*/)?"; i=$((i + 2))
        elif [ "${p:i:2}" = '**' ]; then re="$re[^[:space:]]*"; i=$((i + 1))
        else re="$re$W*"; fi ;;
      '?') re="$re$W" ;;
      '[')   # a character class stays one; a lone bracket is text
        rest="${p:i+1}"; cls="${rest%%]*}"
        if [ "$cls" != "$rest" ] && [ -n "$cls" ]; then re="$re[${cls/#!/^}]"; i=$((i + ${#cls} + 1)); else re="$re\\["; fi ;;
      '.' | '+' | '(' | ')' | ']' | '{' | '}' | '^' | '$' | '|') re="$re\\$c" ;;
      '\') ;;
      *) re="$re$c" ;;
    esac
    i=$((i + 1))
  done
  re="(^|$N)($pre$re)$end"
  # A rule that does not make a valid expression is passed over, without a message.
  if [[ "$cmd" =~ $re ]] 2>/dev/null; then
    name="${BASH_REMATCH[2]}"; name="${name//[\"\\]/}"; pat="${pat//[\"\\]/}"
    msg="odexis: this command names $name, which this project's settings keep from being read (the rule Read($pat)); the rule holds here too. Leave that file's content out and tell the user it was left out. If the command does not read the file and only has the name in a text (a commit message, a line for another file), write that text with the file tools or without the name; any other step with that file is the user's to run."
    if [ "$agy" = 1 ]; then printf '%s\n' "{\"decision\":\"deny\",\"reason\":\"$msg\"}"
    else printf '%s\n' "{\"hookSpecificOutput\":{\"hookEventName\":\"PreToolUse\",\"permissionDecision\":\"deny\",\"permissionDecisionReason\":\"$msg\"}}"; fi
    exit 0
  fi
done <<< "$rules"
exit 0

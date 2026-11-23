#!/bin/bash
# odexis, end of a reply: adds one fact, at most once per conversation (in Claude Code without
# blocking; in Antigravity, whose only way to say something here is one more turn, as that turn),
# when the "Corrections" section of odexis/status.md changed since the conversation began and
# now holds two or more corrections (the only case in which one may have come twice).
# It writes nothing into the project; its own short note lives in the plugin's data folder.
input="$(cat)"
case "$input" in *'"stop_hook_active":true'* | *'"stop_hook_active": true'* | *'"continuationActive":true'* | *'"continuationActive": true'*) exit 0 ;; esac
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
data="${CLAUDE_PLUGIN_DATA:-$PLUGIN_DATA}"
status="$proj/odexis/status.md"
[ -f "$status" ] || exit 0
[ -n "$data" ] || exit 0
sid="$(printf '%s' "$input" | sed -n -E 's/.*"(session_id|conversationId)"[[:space:]]*:[[:space:]]*"([A-Za-z0-9_-]*)".*/\2/p' | head -n 1)"
[ -n "$sid" ] || exit 0
base="$data/sessions/$sid.base"
said="$data/sessions/$sid.said"
[ -f "$base" ] || exit 0
[ -f "$said" ] && exit 0
section="$(awk '/^## /{on=($0 ~ /^## Corrections/)} on' "$status")"
[ "$(printf '%s\n' "$section" | cksum)" = "$(cat "$base")" ] && exit 0
count=$(printf '%s\n' "$section" | sed '1d' | grep -v '^[[:space:]]*$' | grep -v -c '^[[:space:]]*(none')
[ "$count" -ge 2 ] || exit 0
: > "$said" || exit 0
grow="odexis:grow"; [ "$agy" = 1 ] && grow="grow"
msg="odexis: the Corrections section of odexis/status.md changed in this conversation and now holds $count corrections. When two of them say the same thing, the $grow skill turns them into a rule; otherwise nothing more is needed."
if [ "$agy" = 1 ]; then printf '%s\n' "{\"decision\":\"continue\",\"reason\":\"$msg\"}"
else printf '%s\n' "{\"hookSpecificOutput\":{\"hookEventName\":\"Stop\",\"additionalContext\":\"$msg\"}}"; fi
exit 0

#!/bin/bash
# odexis, session start: reports facts about the project's odexis files. It gives no orders and
# changes no file of the project. Silent in a project that has nothing to do with odexis.
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
data="${CLAUDE_PLUGIN_DATA:-$PLUGIN_DATA}"
status="$proj/odexis/status.md"
say() { # Antigravity takes the line as a JSON step and starts odexis's commands without the prefix
  if [ "$agy" = 1 ]; then
    local t="${1//\/odexis:/\/}"; t="${t//[\"\\]/}"
    printf '%s\n' "{\"injectSteps\":[{\"systemMessage\":{\"systemMessage\":\"$t\"}}]}"
  else echo "$1"; fi
}
loads=0
[ -f "$proj/CLAUDE.md" ] && grep -q '@odexis/status\.md' "$proj/CLAUDE.md" 2>/dev/null && loads=1
if [ ! -f "$status" ] && [ "$loads" = 0 ]; then
  # Not set up. Say one fact only where the project itself turns odexis on.
  cat "$proj/.claude/settings.json" "$proj/.claude/settings.local.json" 2>/dev/null | tr -d '\r\n' |
    grep -Eq '"odexis@odexis"[[:space:]]*:[[:space:]]*true' &&
    say "odexis: this project turns the odexis plugin on but is not set up yet. Setup is started only by the user, with /odexis:setup."
  exit 0
fi

# Baseline for the stop step: the Corrections section as it was when this conversation began.
sid="$(printf '%s' "$input" | sed -n -E 's/.*"(session_id|conversationId)"[[:space:]]*:[[:space:]]*"([A-Za-z0-9_-]*)".*/\2/p' | head -n 1)"
if [ -n "$sid" ] && [ -n "$data" ] && [ -f "$status" ]; then
  mkdir -p "$data/sessions" 2>/dev/null
  section="$(awk '/^## /{on=($0 ~ /^## Corrections/)} on' "$status")"
  [ -f "$data/sessions/$sid.base" ] || printf '%s\n' "$section" | cksum > "$data/sessions/$sid.base" 2>/dev/null
  find "$data/sessions" -type f -mtime +30 -delete 2>/dev/null
fi

if [ ! -f "$status" ]; then
  say "odexis: odexis/status.md is missing; CLAUDE.md still loads it."
  exit 0
fi

out="odexis: odexis/status.md was last changed on $(date -r "$status" +%Y-%m-%d 2>/dev/null || stat -f %Sm -t %Y-%m-%d "$status" 2>/dev/null)."

lines=$(cat "$proj/AGENTS.md" "$status" 2>/dev/null | wc -l | tr -d ' ')
[ "${lines:-0}" -ge 200 ] && out="$out AGENTS.md and odexis/status.md together have $lines lines; the measure is under 200. This is worth telling the user once: /odexis:prune (started by the user) brings it down."

# Header fields, between the first two --- lines of the status file.
# A carriage return or a byte-order mark must not hide the header.
head_block="$(tr -d '\r' < "$status" | awk 'NR==1{sub(/^\357\273\277/,"")} NR==1 && $0!="---"{exit} NR>1 && $0=="---"{exit} NR>1{print}')"
field() { printf '%s\n' "$head_block" | sed -n "s/^$1:[[:space:]]*//p" | head -n 1 | sed "s/[[:space:]]*\$//; s/^[\"']//; s/[\"']\$//"; }
pruned="$(field odexis_pruned)"
files="$(field odexis_files)"
pmodel="$(field odexis_model)"
if [ -z "$pruned$files$pmodel$(field odexis_installed)" ]; then
  out="$out The status header has no odexis fields, so only the date and the length could be measured; /odexis:setup (started by the user) adds them."
else
  missing=""
  old_ifs="$IFS"; IFS=','
  for f in $files; do
    f="$(printf '%s' "$f" | sed "s/^[[:space:]]*//; s/[[:space:]]*\$//; s/^[\"']//; s/[\"']\$//")"
    [ -n "$f" ] && [ ! -e "$proj/$f" ] && missing="$missing $f"
  done
  IFS="$old_ifs"
  [ -n "$missing" ] && out="$out Setup files that are missing:$missing. This is worth telling the user once: /odexis:setup (started by the user) adds what is missing."
  case "$pruned" in
    [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9])
      y=$(date +%Y); m=$(date +%m); d=$(date +%d)
      ty=$((10#$y)); tm=$((10#$m - 3))
      [ "$tm" -le 0 ] && { tm=$((tm + 12)); ty=$((ty - 1)); }
      limit="$(printf '%04d-%02d-%s' "$ty" "$tm" "$d")"
      [[ "$pruned" < "$limit" ]] && out="$out The last prune was on $pruned, more than three months ago. This is worth telling the user once: /odexis:prune is started by the user."
      ;;
  esac
  # The tool does not always give the model name; a suffix such as [1m] is not part of it.
  model="$(printf '%s' "$input" | sed -n -E 's/.*"(model|modelName)"[[:space:]]*:[[:space:]]*"([^"]*)".*/\2/p' | head -n 1 | sed 's/\[.*$//')"
  [ "$model" = auto ] && model=""   # Antigravity's name for "the tool chooses": not a model
  if [ -n "$pmodel" ]; then
    if [ -z "$model" ]; then
      out="$out The model at the last prune was $pmodel; if that is not this session's model, it is worth telling the user once: /odexis:prune is started by the user."
    elif [ "$model" != "$pmodel" ]; then
      out="$out This session's model is $model; the model at the last prune was $pmodel. This is worth telling the user once: /odexis:prune is started by the user."
    fi
  fi
fi
say "$out"
exit 0

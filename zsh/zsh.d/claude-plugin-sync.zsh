# Auto-sync Claude plugin skills on shell startup (< 10ms when up-to-date)
[[ -x "$HOME/.claude/bin/sync-plugin-skills.sh" ]] && "$HOME/.claude/bin/sync-plugin-skills.sh" --check

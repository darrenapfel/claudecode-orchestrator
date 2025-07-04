# Claude Orchestrator Aliases

# Project initialization
alias claude-init="~/.claude/init-project.sh"

# Validation
alias claude-validate="~/.claude/hooks/validate.sh"

# Task management (updated for .work structure)
alias claude-task='f() { mkdir -p ".work/tasks/$(date +%Y%m%d-%H%M%S)-$1" && echo "Created task: $1"; }; f'

# Status viewing (updated for .work structure)
alias claude-status="cat .work/PROJECT-STATE.md 2>/dev/null || echo 'No PROJECT-STATE.md found'"
alias claude-architecture="ls -la .work/architecture/ 2>/dev/null || echo 'No architecture directory found'"
alias claude-tasks="ls -la .work/tasks/ 2>/dev/null || echo 'No tasks found'"
alias claude-sessions="ls -la .work/sessions/ 2>/dev/null || echo 'No sessions found'"

# Evidence viewing (updated for .work structure)
alias claude-evidence='find .work/tasks -name "EVIDENCE.md" -type f -exec echo "=== {} ===" \; -exec head -20 {} \; -exec echo \;'


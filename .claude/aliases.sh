# Claude Orchestrator Aliases

# Project initialization
alias claude-init="~/.claude/init-project.sh"

# Validation
alias claude-validate="~/.claude/hooks/validate.sh"

# Task management (updated for .work structure)
alias claude-task='f() { mkdir -p ".work/tasks/$(date +%Y%m%d-%H%M%S)-$1" && echo "Created task: $1"; }; f'

# Status viewing (updated for .work structure)
alias claude-status="cat .work/Status/STATUS.md 2>/dev/null || echo 'No STATUS.md found'"
alias claude-todo="cat .work/Status/TODO.md 2>/dev/null || echo 'No TODO.md found'"
alias claude-issues="cat .work/Status/ISSUES.md 2>/dev/null || echo 'No ISSUES.md found'"
alias claude-decisions="cat .work/Status/DECISIONS.md 2>/dev/null || echo 'No DECISIONS.md found'"

# Evidence viewing (updated for .work structure)
alias claude-evidence='find .work/tasks -name "EVIDENCE.md" -type f -exec echo "=== {} ===" \; -exec head -20 {} \; -exec echo \;'

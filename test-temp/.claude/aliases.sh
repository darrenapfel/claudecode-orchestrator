# Claude Orchestrator Aliases

# Project initialization
alias claude-init="~/.claude/init-project.sh"

# Validation
alias claude-validate="~/.claude/hooks/validate.sh"

# Milestone management
alias claude-milestone='f() { mkdir -p ".work/milestones/$(date +%Y%m%d)-$1" && echo "Created milestone: $1"; }; f'

# Status viewing
alias claude-status="cat .work/PROJECT-STATE.md 2>/dev/null || echo 'No PROJECT-STATE.md found'"
alias claude-architecture="ls -la .work/foundation/architecture/ 2>/dev/null || echo 'No architecture directory found'"
alias claude-milestones="ls -la .work/milestones/ 2>/dev/null || echo 'No milestones found'"
alias claude-current-sprint='find .work/milestones -name "sprint-*" -type d | sort | tail -1'

# Evidence viewing
alias claude-evidence='find .work/milestones -name "EVIDENCE.md" -type f -exec echo "=== {} ===" \; -exec head -20 {} \; -exec echo \;'
alias claude-validations='find .work/milestones -name "validation-*" -type d | sort'

# Git status helpers
alias claude-git="git log --oneline -10 --graph"
alias claude-uncommitted="git status --porcelain"

# Quick navigation
alias claude-work="cd .work"
alias claude-current='cd $(find .work/milestones -name "sprint-*" -type d | sort | tail -1)'

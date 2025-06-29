# Orchestrator.sh Changelog

## Version 2.1.0 - Automatic Orchestration Mode

### 🚨 Breaking Changes
- CLAUDE.md now starts with mandatory trigger detection instructions
- Default Claude behavior is overridden when trigger words are detected

### ✨ New Features
- **Automatic Orchestration Detection**: Claude will automatically enter orchestration mode when detecting trigger words like "build", "create", "implement", etc.
- **New triggers.md file**: Comprehensive list of orchestration triggers in `.claude/preferences/triggers.md`
- **Imperative Instructions**: CLAUDE.md rewritten with command-style instructions that demand immediate action

### 📝 File Changes
- **Modified CLAUDE.md**: 
  - Added "MANDATORY INSTRUCTIONS - EXECUTE IMMEDIATELY" section at top
  - Listed specific trigger words and required actions
  - Made instructions imperative rather than descriptive
  
- **Modified tool-priorities.md**:
  - Added "INITIAL RESPONSE PROTOCOL" section
  - Made trigger checking the first priority
  - Added exact response format for orchestration mode

- **New triggers.md**:
  - Primary triggers (always orchestrate)
  - Context triggers (check context)
  - Example phrases
  - Non-triggers (direct response OK)

### 📊 Statistics
- Global installation: Now creates 28 files (up from 27)
- Local installation: Now creates 33 files (up from 32)

### 🎯 Expected Behavior
When a user says "build me X" or uses any trigger word:
1. Claude immediately recognizes the trigger
2. Responds: "Loading orchestrator persona for task management..."
3. Loads orchestrator persona
4. Never writes code directly
5. Follows full orchestration protocol

### 🔧 How to Update
```bash
# Remove old installation
rm -rf ~/.claude

# Run new orchestrator.sh
./orchestrator.sh

# Choose option 1 for global setup
```

### 📌 Notes
- This version aims to make orchestration mode automatic without requiring users to explicitly ask for it
- The key change is making instructions imperative and action-oriented
- Trigger detection happens BEFORE any other processing
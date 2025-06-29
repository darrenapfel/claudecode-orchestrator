# Orchestrator.sh Changelog

## Version 2.5.0 - Complete Orchestration Platform

### 🎨 Major Enhancements
- **Visual Progress Monitoring**: Real-time ASCII dashboards showing parallel task execution
- **Living Architecture System**: Elite Architect persona with automated documentation
- **Performance Engineering**: Comprehensive testing with Playwright + native load testing tools (Artillery/Autocannon)
- **Enhanced UX Design**: Visual validation and responsive testing capabilities
- **Session State Management**: Unlimited continuity across sessions with PROJECT-STATE.md
- **Automated Script Generation**: build-orchestrator.js for maintaining the deployment script

### ✨ New Features
- **11 Specialized Personas** (up from 4):
  - Orchestrator (enhanced with progress tracking)
  - Elite Architect (system governance)
  - Software Engineer (Context7 integration)
  - UX Designer (visual validation)
  - Documentation Writer (screenshot automation)
  - Performance Engineer (full-stack testing)
  - SDET, Test Engineer, DevOps, Security Engineer, Validator
  
- **Architecture Templates** (9 new):
  - ADR template, boundaries, data flow, dependencies
  - System health, patterns, system map, tech stack
  
- **Enhanced Validation**:
  - Cross-stream validation prevents self-validation
  - Visual proof requirements with screenshots
  - Performance budget enforcement
  - Security audit integration

### 🔧 Technical Improvements
- **Parallel Execution**: Intelligent dependency analysis for optimal task scheduling
- **MCP Integration**: Playwright for visual testing, Context7 for latest docs
- **Load Testing**: Replaced Locust MCP with native tools (Artillery, Autocannon)
- **Automated Deployment**: Single 790KB orchestrator.sh with 52 embedded files

### 📊 Statistics
- Total files: 52 (up from 33 in v2.1)
- Script size: 790KB (comprehensive system)
- New personas: 7 additions
- Architecture templates: 9 new files
- Enhanced validators: 4 specialized types

### 🚀 Installation
```bash
# Global installation
curl -sSL https://raw.githubusercontent.com/darrenapfel/claudecode-orchestrator/main/orchestrator.sh | bash

# Or download and run
./orchestrator.sh
```

### 🔄 Migration from v2.1
- All v2.1 features preserved and enhanced
- Backwards compatible with existing projects
- New features activate automatically with trigger words

---

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
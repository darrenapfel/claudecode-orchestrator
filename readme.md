# Claude Code Orchestrator v2.5 🎭

**Transform Claude into a parallel-executing software development team** - with autonomous task management, continuous execution, and evidence-based validation.

## 🚀 What is Claude Orchestrator?

Claude Orchestrator is a streamlined framework that enables Claude Code to operate as a complete, **parallel-executing** software development team. It ensures continuous execution until mission completion, with no stopping at partial success.

### Key Innovation: Autonomous Continuous Execution

The orchestrator executes tasks in parallel while ensuring:
- **Continuous execution** - Never stops at 75% completion, continues to 100%
- **Multi-step persistence** - Completes all user-specified steps without stopping
- **Evidence-based validation** - Every task produces verifiable proof
- **Mission target tracking** - Distinguishes between phase completion and mission success

## 🎯 Core Capabilities

### Parallel Development Team
- **Orchestrator**: Task breakdown and parallel coordination (never writes code)
- **Software Engineer**: Production-ready implementation
- **SDET**: Comprehensive test automation
- **Security Engineer**: Security audits and threat modeling
- **UX Designer**: UI/UX design and validation
- **Performance Engineer**: Load testing with Artillery/Autocannon
- **Documentation Writer**: API and user documentation
- **Validator**: Independent verification (adversarial mindset)
- **DevOps**: Automated deployment and CI/CD

### Autonomous Execution Protocol
```
User: "Fix all 24 tools to 100% working"
    ↓
Phase 1: Orchestrator creates 8 parallel tasks
    → 75% tools working (18/24)
    → Automatically continues (no user interaction)
    ↓
Phase 2: Creates 6 new tasks for remaining tools
    → 92% tools working (22/24)
    → Automatically continues
    ↓
Phase 3: Final 2 tasks
    → 100% tools working (24/24)
    → Mission complete ✅
```

## 💡 Key Features

### 1. Never Stops at Partial Success
- **Wrong**: "17/24 tools working, mission complete" ❌
- **Right**: "17/24 working, starting repair phase for 7 remaining" ✅

### 2. Multi-Step Continuation
- **User**: "1. Review the code 2. Fix all issues"
- **Orchestrator**: Completes step 1, automatically continues to step 2

### 3. Evidence-Based Validation
Every task produces:
- EVIDENCE.md with proof of completion
- Git commits with changes
- Test results and coverage
- Performance metrics

### 4. Parallel Execution Strategies
- **Full Parallel**: No dependencies, all streams simultaneously
- **Progressive Parallel**: Phased execution respecting dependencies
- **Smart Convergence**: Waits for streams to complete before proceeding

## 📦 Installation

### Quick Start
```bash
# Download the installer
curl -O https://raw.githubusercontent.com/darrenapfel/claudecode-orchestrator/main/orchestrator.sh
chmod +x orchestrator.sh

# Run interactive installer
./orchestrator.sh

# Choose:
# 1) Global installation (~/.claude) - For all projects
# 2) Local installation (./.claude) - For current project only
```

### Trigger Words
When you use these words, Claude automatically loads the orchestrator:
- build, create, implement, make, develop
- fix, add feature, refactor
- new app, new project, new component

## 🏗️ Repository Structure

### This Repository (Development)
```
orchestration-test/
├── orchestrator-files/    # All files to be installed
│   ├── .claude/          # Orchestration configuration
│   ├── .work/            # Working directory templates
│   └── CLAUDE.md         # Root instructions
├── build-orchestrator.js  # Builds installer from orchestrator-files/
├── orchestrator.sh        # Generated installer script
└── test-*.js             # Test files for development
```

### After Installation (Your Project)
```
project/
├── CLAUDE.md              # Orchestration entry point
├── .claude/               # Orchestration system
│   ├── personas/          # Development team roles
│   ├── validators/        # Testing protocols
│   └── preferences/       # Tech stack, git workflow
└── .work/                 # Working directory
    ├── tasks/            # Task definitions and evidence
    ├── sessions/         # Session management
    └── Status/           # Project status tracking
```

## 🎯 Benefits

### For Developers
- **Autonomous execution** - Set a target, orchestrator continues until achieved
- **Parallel efficiency** - Multiple personas work simultaneously
- **No manual coordination** - Orchestrator manages all dependencies
- **Evidence-based** - Every claim backed by reproducible proof
- **Git-first workflow** - All changes tracked and committed

### For Projects
- **Faster delivery** - Parallel execution with smart convergence
- **Higher quality** - Independent validation on every task
- **Complete implementation** - Never stops at partial success
- **Clear progress** - Task-based tracking with evidence
- **Zero "should work"** - Everything verified before completion

## 🔧 Development

### Modifying the Orchestrator

1. **Edit files in `orchestrator-files/`** - This contains all installable content
2. **Rebuild the installer**:
   ```bash
   node build-orchestrator.js
   ```
3. **Test locally**:
   ```bash
   ./orchestrator.sh local
   ```

### File Organization

- `orchestrator-files/` - All files that get installed
- `build-orchestrator.js` - Script that builds orchestrator.sh
- `.ignore-working-docs/` - Development notes and working files
- Test files remain at root for easy access

## 🤝 Contributing

We welcome contributions! Priority areas:
- Additional framework templates
- Industry-specific validators
- Performance optimization strategies
- Security audit protocols

## 📄 License

MIT License - Free for personal and commercial use.

## 🙏 Acknowledgments

Created to solve the "it stops at 75%" problem and enable truly autonomous AI development.

---

**Ready to experience autonomous, parallel development?**

1. Install orchestrator
2. Give Claude a mission (not just a task)
3. Watch it execute to 100% completion

*Parallel execution. Continuous progress. Mission completion.*
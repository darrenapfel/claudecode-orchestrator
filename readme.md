# Claude Code Orchestration System

A comprehensive orchestration framework that enables Claude Code to operate as a full software development team through parallel execution, structured workflows, and evidence-based validation.

## 🎯 Core Philosophy

**Quality Through Truth**: The system enforces honest development practices where every claim requires evidence, every test result must be shown, and validation failures are documented and fixed rather than hidden. This approach paradoxically saves tokens by catching issues early rather than building on broken foundations.

## 🚀 Quick Start

### Global Installation (Recommended)
```bash
# Install globally for use across all projects
./orchestrator.sh global

# Then in any project:
./orchestrator.sh local
```

### Local Installation Only
```bash
# Install directly in current project
./orchestrator.sh local
```

## 🏗️ System Architecture

### Parallel Execution Model
The orchestrator manages multiple specialized personas working simultaneously on different aspects of your project:

- **Requirements & Design**: Product Manager and Architect work in parallel to define scope
- **Implementation**: Multiple Software Engineers tackle independent features concurrently  
- **Testing**: SDETs write tests while implementation occurs
- **Validation**: Four validators (PM, Test, Performance, Security) verify in parallel

### Milestone-Based Development
Work is organized into major development phases (milestones) containing multiple sprints:

```
.work/
├── milestones/
│   └── 20250704-local-development/
│       ├── sprint-001/
│       ├── sprint-002/
│       └── sprint-003/
└── foundation/
    ├── architecture/
    ├── product/
    └── ux/
```

### Git Integration
Every validated task is automatically committed with file isolation:

- Each task commits only its specific files
- Validation results are committed (pass or fail)
- Fix cycles get separate commits
- Integration fixes are isolated from features
- All git actions are announced in chat for visibility

## 📋 Key Features

### Task-Level Commit Isolation
- Every task tracks which files it creates/modifies
- Commits include only task-specific files
- Prevents cross-contamination between parallel work
- Integration commits connect separate features

### Numbered Validation Cycles
- `validation-1/` - Initial validation attempt
- `validation-2/` - After first fix cycle
- `validation-N/` - Continue until 100% pass
- No predetermined "final" validation

### Evidence-Based Development
- Every task produces EVIDENCE.md with reproducible proof
- Test outputs must be complete, not summarized
- Screenshots require timestamps
- Commands must show actual execution

### Fix Cycle Protocol
- Validation failures trigger fix cycles (normal and expected)
- Each fix cycle is documented and committed
- Multiple cycles show honest development progress
- Success is achieving 100% pass, not avoiding failures

### Master Reference Documents
- `MASTER-DIRECTORY-STRUCTURE.md` - Single source of truth for organization
- `GIT-COMMIT-STRATEGY.md` - Authoritative git workflow
- All other documents reference these masters

## 👥 Available Personas

### Core Team
- **Orchestrator** - Manages parallel execution and git operations
- **Product Manager** - Defines requirements and validates user value
- **Architect** - Designs system structure and technical approach
- **Software Engineer** - Implements features following architecture
- **UX Designer** - Creates user experiences and interfaces

### Quality Assurance
- **SDET** - Writes comprehensive test suites
- **Test Engineer** - Validates end-to-end functionality
- **Integration Engineer** - Ensures components work together
- **Performance Engineer** - Optimizes speed and scalability
- **Security Engineer** - Validates security and compliance

### Support Roles
- **DevOps** - Handles deployment and infrastructure
- **Documentation Writer** - Creates user and technical docs

## 🔄 Workflow Overview

1. **Discovery** (if needed) - Gather clarifying questions
2. **Requirements** - PM defines scope and acceptance criteria
3. **Foundation Design** - Architect and UX Designer create blueprint
4. **Implementation** - Engineers build in parallel batches
5. **Integration** - Connect all components and fix issues
6. **Validation** - Four validators verify quality
7. **Fix Cycles** - Address any validation failures
8. **Deployment** - When all validations pass

## 📁 Project Structure

```
your-project/
├── .claude/                 # Orchestration configuration
│   ├── personas/           # AI role definitions
│   ├── patterns/           # Workflow patterns
│   ├── validators/         # Validation protocols
│   └── preferences/        # Project settings
├── .work/                  # Orchestration workspace
│   ├── foundation/         # Core architecture/design
│   ├── milestones/         # Development phases
│   └── discovery/          # Project understanding
├── CLAUDE.md               # Project-specific instructions
└── src/                    # Your actual code
```

## 🛠️ Configuration

### Project Instructions (CLAUDE.md)
Add project-specific guidelines that work alongside the orchestration system:

```markdown
# Project-Specific Instructions

## Tech Stack
- Frontend: React + TypeScript
- Backend: Node.js + Express
- Database: PostgreSQL

## Conventions
- Use functional components
- Follow REST API standards
- Write tests for all endpoints
```

### Tech Stack Templates
Pre-configured templates available in `.claude/preferences/tech-stacks/`:
- `web-saas.md` - Full-stack web application
- `template.md` - Create your own

## 📊 Session Management

The system maintains complete session history and can resume interrupted work:

- `PROJECT-STATE.md` - Current status and progress
- Session transcripts track all decisions
- Git commits preserve code history
- Evidence provides audit trail

## 🔍 Validation Process

Four validators work in parallel to ensure quality:

1. **Product Manager** - Validates user stories work end-to-end
2. **Test Engineer** - Runs comprehensive test suites
3. **Performance Engineer** - Checks speed and scalability
4. **Security Engineer** - Validates security compliance

Any validation failure triggers fix cycles until all pass.

## 💡 Best Practices

### For Maximum Effectiveness

1. **Let Discovery Run** - For new projects, let the orchestrator gather requirements
2. **Trust the Process** - Multiple fix cycles are normal, not failures
3. **Provide Context** - Share existing code, requirements, constraints
4. **Review Evidence** - Check the `.work/` directory to see actual outputs
5. **Use Checkpoints** - Commit to git regularly for easy rollback

### Common Patterns

- **New Project**: Run discovery → Full implementation
- **Add Feature**: Skip discovery → Start at requirements
- **Fix Bugs**: Create fix tasks → Validate thoroughly
- **Refactoring**: Architecture first → Systematic updates

## 🐛 Troubleshooting

### Orchestrator Not Starting
- Ensure you ran `./orchestrator.sh local` in your project
- Check that CLAUDE.md exists (created by installer)
- Verify `.claude/` directory has all personas

### Git Issues
- Orchestrator will ask to create repository if none exists
- All git operations are shown in chat
- Check branch name matches milestone

### Validation Failures
- This is normal! Fix cycles are expected
- Review validation reports in `.work/milestones/`
- Each validator provides specific feedback

## 📚 Documentation

Detailed documentation available in `.claude/`:

- `TASK-EXECUTION-GUIDE.md` - How tasks are executed
- `patterns/standard-workflow.md` - Complete workflow details  
- `patterns/GIT-COMMIT-STRATEGY.md` - Git integration guide
- `examples/` - Implementation examples
- `validators/` - Validation protocols

## 🔧 Advanced Usage

### Custom Personas
Create new personas in `.claude/personas/` following the template.

### Workflow Modifications  
Adjust patterns in `.claude/patterns/` to match your process.

### Hook Scripts
Add automation in `.claude/hooks/` for custom workflows.

## 🤝 Contributing

The orchestration system is built from the `orchestrator-files/` directory:

1. Modify files in `orchestrator-files/`
2. Run `node build-orchestrator.js` to rebuild
3. Test with `./orchestrator.sh local`
4. Submit improvements via pull request

## 📈 Version History

### v5.0.0 (Current)
- Task-level git commits with file isolation
- Orchestrator announces all git actions in chat
- Enhanced file tracking for commit isolation
- Integration commits separate from feature commits
- Master reference documents for consistency

### v4.x
- Milestone-based development structure
- Numbered validation cycles
- Sprint organization improvements
- Enhanced evidence requirements

### v3.x
- Parallel execution model
- Evidence-based validation
- Session management

### Earlier
- Initial orchestration concepts
- Basic persona definitions

## 🎯 Why It Works

The orchestration system succeeds by:

1. **Enforcing Honesty** - Can't claim success without proof
2. **Working in Parallel** - Multiple tasks progress simultaneously
3. **Validating Continuously** - Catch issues early, fix immediately
4. **Tracking Everything** - Complete audit trail of all work
5. **Iterating to Success** - Fix cycles are normal, not failures

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/darrenapfel/orchestration-test/issues)
- **Discussions**: [GitHub Discussions](https://github.com/darrenapfel/orchestration-test/discussions)
- **Wiki**: [Documentation Wiki](https://github.com/darrenapfel/orchestration-test/wiki)

---

Built with the principle that honest development with visible evidence produces better software faster than hiding failures and building on broken foundations.
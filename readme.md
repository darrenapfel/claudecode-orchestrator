# Claude Code Orchestrator v2.5 🎭

**Transform Claude into an intelligent, parallel software development organization** - with real-time visual progress, living architecture documentation, performance testing, and visual UX validation.

## 🚀 What is Claude Orchestrator?

Claude Orchestrator v2.5 is an advanced framework that enables Claude Code to operate as a complete, **parallel-executing** software development team. With real-time visual progress tracking, living architecture documentation, and performance testing capabilities, it delivers enterprise-grade software with unprecedented quality and speed.

### Key Innovation: Intelligent Parallel Execution

Unlike sequential approaches, v2.5 features **intelligent parallel execution with visual progress tracking**:
- **Orchestrator**: Real-time ASCII progress dashboard with dependency analysis
- **Elite Architect**: Living architecture docs that evolve with your codebase [NEW]
- **Software Engineer**: Production-ready code with Context7 latest documentation
- **SDET**: Comprehensive test suites with coverage reporting
- **Security Engineer**: Real-time security audits and threat modeling
- **UX Designer**: Visual validation with Playwright screenshots [NEW]
- **Performance Engineer**: Load testing with Playwright + Artillery/Autocannon [NEW] 
- **Documentation Writer**: Context7-powered docs with visual validation [NEW]
- **Validator**: Adversarial validation across all streams
- **DevOps**: Automated deployment with interactive workflows

## 🎨 New in v2.5: Visual Progress & Enhanced Capabilities

### Real-Time Visual Progress Dashboard
Watch your parallel development streams in real-time with ASCII progress bars:

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    🎭 ORCHESTRATION SESSION v2.5                        │
│                         Feature: User Authentication                     │
├─────────────────────────────────────────────────────────────────────────┤
│ Session Progress: [████████████████████████████░░░░░░░░░░░░] 70% │ 21/30min │
├─────────────────────────────────────────────────────────────────────────┤
│ 🔧 SOFTWARE ENG   [██████████████████████████████████████] 100% ✅ Done  │
│ 🧪 SDET           [████████████████████████████████░░░░░░] 80%  🔄 21min │
│ 🔒 SECURITY ENG   [██████████████████████████░░░░░░░░░░░░] 65%  🔄 24min │
│ 🎨 UX DESIGNER    [████████████████████████████████░░░░░░] 75%  🔄 22min │
│ ⚡ PERFORMANCE     [████████████████████░░░░░░░░░░░░░░░░░░] 50%  🔄 27min │
└─────────────────────────────────────────────────────────────────────────┘
```

### Intelligent Execution Strategies
The orchestrator analyzes dependencies and chooses optimal execution:

1. **Full Parallel** - No dependencies, all streams simultaneously
2. **Progressive Parallel** - Phased execution with dependency respect
3. **Conditional Streams** - Smart persona inclusion based on task scope
4. **Visual Convergence** - Real-time countdown to completion

### Example: Enhanced Development Session
```
User Request: "Build secure authentication with MFA"
    ↓
🎭 Orchestrator analyzes dependencies & displays visual dashboard
🏛️ Architect reviews system impact & updates architecture docs
🔧 Software Engineer implements with latest Context7 documentation
🧪 SDET creates comprehensive test suite in parallel
🔒 Security Engineer audits for vulnerabilities concurrent with dev
🎨 UX Designer creates Playwright screenshots for visual validation
⚡ Performance Engineer load tests with realistic user scenarios
📚 Documentation Writer creates docs with visual examples
    ↓
Result: 5x faster delivery with visual validation & living architecture
```

## 💡 Why Claude Orchestrator v2.5?

### Evolution from v2.1 to v2.5
While v2.1 introduced intelligent parallelism, v2.5 adds critical capabilities:
- **No visual feedback** → Real-time ASCII progress dashboards
- **Manual architecture tracking** → Living architecture documentation
- **Basic testing** → Performance testing with Playwright + Artillery/Autocannon
- **Limited documentation** → Context7-powered latest documentation
- **Session context loss** → Efficient state preservation between sessions

### The v2.5 Solution
Claude Orchestrator v2.5 delivers:
- **Visual progress tracking** - Real-time ASCII dashboards with status
- **Living architecture** - Documentation that evolves with your code
- **Performance validation** - Built-in load testing and Core Web Vitals
- **Visual UX validation** - Playwright screenshots and responsive testing
- **Session continuity** - Efficient context handoff between sessions
- **Latest documentation** - Context7 integration for up-to-date references

## 🎯 Benefits

### For Developers
- **Visual development experience** - Real-time progress with animated ASCII dashboards
- **Context continuity** - Seamless handoff between sessions with state preservation
- **Performance-first** - Built-in load testing and Core Web Vitals monitoring
- **Visual validation** - Playwright screenshots ensure UI quality
- **Latest documentation** - Context7 integration for up-to-date API references
- **Architecture governance** - Living docs prevent technical debt accumulation

### For Projects
- **Living architecture system** - Documentation that evolves with your codebase
- **Performance monitoring** - Automatic load testing and optimization
- **Visual UX validation** - Screenshot-based design verification
- **Session state management** - Efficient context preservation (200-line handoffs)
- **MCP tool integration** - Leverage Playwright and Context7 MCPs
- **Real-time transparency** - Visual progress tracking for stakeholders

## 📦 Installation

### Quick Start (Recommended)
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

### Post-Installation
```bash
# For global installation
source ~/.claude/aliases.sh
echo "source ~/.claude/aliases.sh" >> ~/.bashrc

# Initialize any project
cd your-project
claude-init
```

### Project Setup
```bash
# In any project directory
claude-init

# Or manually
~/.claude/init-project.sh
```

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
│   ├── preferences/       # Tech stack, git workflow, permissions
│   ├── personas/          # Development team roles
│   ├── validators/        # Testing protocols
│   └── hooks/            # Automation scripts
└── .work/                # Active work (tracked in git!)
    ├── Status/           # TODO, STATUS, ISSUES, DECISIONS
    ├── sessions/         # Daily work documentation
    ├── tasks/           # Task evidence and artifacts
    └── reports/         # Test and performance results
```

## 🔧 Configuration

### Tech Stack
Configure your stack in `.claude/preferences/tech-stacks/`:
- Next.js 14+ with TypeScript
- Supabase backend
- Tailwind CSS
- Jest + Playwright testing

### Git Workflow
Automatic session management:
```bash
# Start of session
git checkout -b session/YYYYMMDD-feature

# After each task
git commit -m "feat: implement login
- Added auth endpoints
- 95% test coverage
- Evidence: .work/tasks/*/EVIDENCE.md"

# End of session
gh pr create
```

## 🎮 Usage

### Starting a Session
```markdown
Load ~/.claude/personas/orchestrator.md

I need to build a user authentication system with email/password login,
JWT tokens, and password reset functionality.
```

### Claude's Response
```markdown
## Task Breakdown

### TASK-001: Authentication API Endpoints
**Assigned to**: @software-engineer
**Duration**: 30 minutes
**Exit Criteria**:
- POST /api/register endpoint
- POST /api/login endpoint  
- Tests with 80%+ coverage
- Response time < 200ms
```

### Evidence Example
Every task produces evidence in `.work/tasks/*/EVIDENCE.md`:
```markdown
# Task Evidence: Authentication API
**Generated**: 2024-01-15T10:30:45Z
**Exit Criteria**: ✅ ALL PASSED

## Test Results
PASS tests/auth.test.ts
✓ registers new users (87ms)
✓ prevents duplicate emails (12ms)
✓ validates passwords (95ms)
Coverage: 92.3%

## API Verification
$ curl -X POST localhost:3000/api/register
{"id":"usr_123","email":"test@example.com"}
Response time: 126ms ✅
```

## 🚦 How Enhanced Parallel Execution Works

1. **Orchestrator** displays visual dashboard and analyzes dependencies
2. **Architect** reviews impact on existing system architecture
3. **Multiple streams** start simultaneously with real-time progress bars
4. **Implementation** builds with Context7 latest documentation
5. **Testing** creates comprehensive test suites in parallel
6. **UX Designer** validates design with Playwright screenshots
7. **Performance Engineer** load tests with realistic scenarios
8. **Security** audits in real-time with vulnerability scanning
9. **Visual Convergence** point with animated countdown
10. **Evidence** compiled from all streams with visual proof

## 🛡️ Quality Guarantees

- **No Placeholders**: Automatic rejection of TODOs, mocks, Lorem ipsum
- **Real Testing**: Actual test execution, not just test files
- **Working Code**: Screenshots and reproduction commands required
- **Adversarial Validation**: Different persona must verify claims

## 🔥 Advanced Features

### 24-Hour Autonomous Sessions
With Claude Max plan + virtualized environment:
```bash
# Start Claude Code with permissions flag
claude-code --dangerously-skip-permissions

# Load orchestrator
Load CLAUDE.md

# Provide project requirements
Build a complete SaaS application with:
- User authentication
- Subscription management  
- Admin dashboard
- API documentation
```

### MCP Tool Integration
Optimized for Model Context Protocol tools:
- **Playwright MCP** - Screenshots, visual testing, Core Web Vitals
- **Context7 MCP** - Latest documentation for accurate code generation
- **Artillery/Autocannon** - Load testing and performance benchmarking
- **GitHub MCP** - Repository management and PR automation
- **Supabase MCP** - Backend operations and database management

## 📊 Performance Improvements

### v2.1 vs v2.5 Comparison
| Feature | v2.1 Parallel | v2.5 Enhanced | Improvement |
|---------|--------------|---------------|-------------|
| Progress Tracking | Basic status | Real-time ASCII dashboard | Visual feedback |
| Architecture Docs | Manual | Living documentation | Auto-updating |
| Performance Testing | Basic tests | Playwright + Artillery | Full stack testing |
| Documentation | Static | Context7 latest docs | Always current |
| Session Continuity | Manual prompts | 200-line state files | Efficient handoff |
| UX Validation | Manual | Playwright screenshots | Visual proof |
| Development Speed | 4x faster | 5-7x faster | 25-75% improvement |

## 📊 Results

Projects using Claude Orchestrator v2.5 report:
- **Real-time visibility** into development progress with visual dashboards
- **Living architecture** that prevents technical debt accumulation
- **Performance-first development** with built-in load testing
- **Visual UX validation** reducing design iteration cycles
- **Seamless context preservation** enabling unlimited session continuity
- **5-7x faster** delivery with enhanced parallel capabilities

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
- Additional MCP tool integrations
- Framework-specific architecture templates
- Industry-specific security controls  
- Enhanced progress visualization themes
- Mobile development personas
- AI/ML development capabilities

## 📄 License

MIT License - Free for personal and commercial use.

## 🙏 Acknowledgments

Created by developers tired of "it should work" and inspired by the potential of truly autonomous AI development.

---

**Ready to experience visual, parallel, architecture-governed development?**

1. Install orchestrator v2.5
2. Initialize your project  
3. Watch Claude become your visual development organization

*Real-time progress. Living architecture. Performance-first. Visual validation. Session continuity.*

## Quick Links
- [Installation Guide](https://github.com/darrenapfel/claudecode-orchestrator)
- [Example Projects](#)
- [Video Tutorials](#)
- [Discord Community](#)
# Parallel Execution Guide

## 🚨 THE CARDINAL RULE 🚨

**Multiple Independent Tasks = ONE Message**

This is the #1 most violated rule in orchestration. This guide ensures 100% compliance.

## Visual Decision Tree

```
┌─────────────────────────────────┐
│   Can tasks run independently?  │
└────────────┬────────────────────┘
             │
      ┌──────┴──────┐
      │             │
     YES            NO
      │             │
      ▼             ▼
╔═══════════╗  ┌─────────────┐
║ PARALLEL  ║  │ Sequential  │
║ ONE MSG!  ║  │ (if blocked)│
╚═══════════╝  └─────────────┘
```

## Step-by-Step Parallel Execution

### BEFORE Creating Tasks

**🛑 STOP AND CHECK:**
1. [ ] How many tasks need to be created?
2. [ ] Are they truly independent?
3. [ ] Have I written ALL task descriptions?
4. [ ] Am I about to send them in ONE message?

### The RIGHT Way - Visual Examples

#### Discovery Phase (6 tasks)
```
═══════════════════════════════════════════════════════════
║  ONE MESSAGE - ALL 6 DISCOVERY TASKS                   ║
═══════════════════════════════════════════════════════════
├── Task: @product-manager - Business questions
├── Task: @architect - Technical questions  
├── Task: @ux-designer - Design questions
├── Task: @devops - Deployment questions
├── Task: @security-engineer - Security questions
└── Task: @orchestrator - Coordination questions
═══════════════════════════════════════════════════════════
```

#### Foundation Phase (2 tasks)
```
╔═══════════════════════════════════════════════════════╗
║  ONE MESSAGE - BOTH FOUNDATION TASKS                 ║
╠═══════════════════════════════════════════════════════╣
║ ├── Task: @architect - System architecture            ║
║ └── Task: @ux-designer - User experience flows        ║
╚═══════════════════════════════════════════════════════╝
```

#### Implementation Phase (varies)
```
┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
┃  ONE MESSAGE - ALL INDEPENDENT FEATURES            ┃
┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
┃ ├── Task: @software-engineer - Auth service         ┃
┃ ├── Task: @software-engineer - User profiles        ┃
┃ ├── Task: @software-engineer - API gateway          ┃
┃ └── Task: @sdet - Test infrastructure               ┃
┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
```

#### Validation Phase (4 tasks)
```
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
▓  ONE MESSAGE - ALL 4 VALIDATORS                  ▓
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
▓ ├── Task: @product-manager - User story check    ▓
▓ ├── Task: @test-engineer - Full test suite       ▓
▓ ├── Task: @performance-engineer - Load testing   ▓
▓ └── Task: @security-engineer - Security audit    ▓
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
```

## 🚫 What NOT to Do

### ❌ WRONG - Sequential Messages
```
Message 1: Task: @architect - Design system
[Waits for response]
Message 2: Task: @ux-designer - Create flows
[Waits for response]
Message 3: Task: @documentation-writer - Draft docs
```

### ❌ WRONG - Announcing Intent
```
"Let me first create a task for the architect..."
"Now I'll assign the UX designer..."
"Next, the documentation writer..."
```

### ❌ WRONG - Partial Batches
```
Message 1: Two tasks
Message 2: One more task
Message 3: The last task
```

## Parallel Execution Phrases

### ✅ ALWAYS Say:
- "Creating all parallel tasks for [phase]..."
- "Executing simultaneous [phase] tasks..."
- "Assigning independent tasks to multiple personas..."

### ❌ NEVER Say:
- "Let me start with..."
- "First, I'll create..."
- "Now for the next task..."
- "Moving on to..."
- "Let me begin by..."

## Special Cases

### When Tasks ARE Dependent
```
Feature A blocks Feature B & C:

Step 1: Task: @software-engineer - Implement Feature A
[Wait for completion and integration]

Step 2: [ONE MESSAGE]
├── Task: @software-engineer - Implement Feature B
└── Task: @software-engineer - Implement Feature C
```

### Mixed Dependencies
```
If A blocks B, but C and D are independent:

Message 1: [THREE TASKS]
├── Task: @software-engineer - Feature A
├── Task: @software-engineer - Feature C  
└── Task: @software-engineer - Feature D

[After A completes]

Message 2: Task: @software-engineer - Feature B
```

## Quick Reference Card

```
┌─────────────────────────────────────────┐
│        PARALLEL EXECUTION CARD          │
├─────────────────────────────────────────┤
│ Discovery:    6 personas - ONE message  │
│ Foundation:   2 personas - ONE message  │
│ Implementation: N tasks - ONE message   │
│ Validation:   4 personas - ONE message  │
│ Deployment:   3 personas - ONE message  │
├─────────────────────────────────────────┤
│ REMEMBER: Count your tasks FIRST        │
│ Then send them ALL AT ONCE              │
└─────────────────────────────────────────┘
```

## Self-Check Questions

Before EVERY task creation:
1. **How many tasks am I about to create?** (Write the number)
2. **Are they ALL independent?** (Yes/No)
3. **Have I written ALL descriptions?** (Yes/No)
4. **Will I send them in ONE message?** (Yes/No)

If any answer is "No", STOP and reconsider.

## The Golden Rule Restated

**IF YOU NEED TO CREATE 3 TASKS, YOUR MESSAGE MUST CONTAIN 3 TASK INVOCATIONS**

Not 1 + 1 + 1  
Not 2 + 1  
But **3 IN ONE MESSAGE**

---

*Parallel execution is not optional. It's the core of our system's efficiency.*
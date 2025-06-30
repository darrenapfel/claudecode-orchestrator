# ASCII Progress Visualization System 📊

Comprehensive ASCII art progress tracking for parallel stream execution with real-time visual feedback.

## Progress Bar Components

### Basic Progress Bar
```
Progress: [████████████████████████████████████████] 100%
Progress: [██████████████████████░░░░░░░░░░░░░░░░░░░░] 75%
Progress: [████████████░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░] 30%
Progress: [░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░] 0%
```

### Animated Working Progress
```
Working:  [▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████░░░░░░░░░░░░░░░░░░░] 55%
Working:  [▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███░░░░░░░░░░░░░░░░░░░░] 57%
Working:  [▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██░░░░░░░░░░░░░░░░░░░░] 59%
```

### Status Indicators
```
✅ Complete    ❌ Failed     ⏳ Waiting    🔄 Working    
⏸️ Blocked     🔔 Ready     ⚠️ Warning    🎯 Target
```

## Parallel Stream Visualization

### Full Parallel Execution Display
```
┌─────────────────────────────────────────────────────────────────────────┐
│                    🎭 ORCHESTRATION SESSION v2.1                        │
│                         Feature: User Authentication                     │
├─────────────────────────────────────────────────────────────────────────┤
│ Session Progress: [████████████████████████████░░░░░░░░░░░░] 70% │ 21/30min │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ 🔧 SOFTWARE ENG   [██████████████████████████████████████] 100% ✅ 18min │
│ 🧪 SDET           [████████████████████████████████░░░░░░] 80%  🔄 21min │
│ 🔒 SECURITY ENG   [██████████████████████████░░░░░░░░░░░░] 65%  🔄 24min │
│ 🎨 UX DESIGNER    [████████████████████████████████░░░░░░] 75%  🔄 22min │
│ ⚡ PERFORMANCE     [████████████████████░░░░░░░░░░░░░░░░░░] 50%  🔄 27min │
│ 📚 DOCUMENTATION  [██████████████░░░░░░░░░░░░░░░░░░░░░░░░] 35%  🔄 29min │
│ 🏛️ ARCHITECT      [██████████████████████████████████████] 100% ✅ 15min │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│ 🎯 CONVERGENCE: Waiting for 5 streams │ ETA: 9 minutes │ Ready: 2/7    │
└─────────────────────────────────────────────────────────────────────────┘
```

### Progressive Parallel (With Dependencies)
```
┌─────────────────────────────────────────────────────────────────────────┐
│                         🔄 PROGRESSIVE EXECUTION                         │
│                          Feature: Database Migration                     │
├─────────────────────────────────────────────────────────────────────────┤
│ Session Progress: [████████████████████░░░░░░░░░░░░░░░░░░░░] 50% │ 15/30min │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ PHASE 1 (T+0→10) │ PHASE 2 (T+10→20) │ PHASE 3 (T+20→30)               │
│ ✅ Schema Design  │ 🔄 API Updates     │ ⏳ Testing                       │
│ ✅ Test Setup     │ 🔄 Frontend       │ ⏳ Documentation                 │
│ ✅ Security       │ 🔄 Performance    │ ⏳ Validation                    │
│                  │                   │                                 │
│ Schema [████████████████████████████████████████] 100% ✅               │
│ API    [████████████████████████░░░░░░░░░░░░░░░░░░] 60%  🔄               │
│ UI     [██████████████████░░░░░░░░░░░░░░░░░░░░░░░░] 45%  🔄               │
│ Tests  [░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░] 0%   ⏳ (blocked)   │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│ 🔗 Dependencies: API→Tests, UI→Tests │ Blocking: Schema Complete ✅      │
└─────────────────────────────────────────────────────────────────────────┘
```

### Error State Visualization
```
┌─────────────────────────────────────────────────────────────────────────┐
│                       ⚠️  ERROR DETECTED - RECOVERY MODE                │
│                          Feature: Payment Integration                    │
├─────────────────────────────────────────────────────────────────────────┤
│ Session Progress: [████████████████████████░░░░░░░░░░░░░░░░] 60% │ ERROR  │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ 🔧 SOFTWARE ENG   [██████████████████████████████████████] 100% ✅ Done  │
│ 🧪 SDET           [████████████████████████████████████▓▓] 95%  ❌ FAIL  │
│ 🔒 SECURITY ENG   [██████████████████████████████████████] 100% ✅ Done  │
│ 🎨 UX DESIGNER    [████████████████████████████████░░░░░░] 75%  ⏸️ PAUSED │
│ ⚡ PERFORMANCE     [░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░] 0%   ⏸️ PAUSED │
│                                                                         │
│ ❌ SDET Error: API tests failing - connection timeout                   │
│ 🔄 RECOVERY: Retrying with extended timeout (Attempt 2/3)              │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│ 🚨 Action Required: Fix API timeout or adjust test parameters          │
└─────────────────────────────────────────────────────────────────────────┘
```

## Compact Progress Displays

### Mini Progress (During Execution)
```
🎭 Auth Feature │ 🔧✅ 🧪🔄 🔒🔄 🎨🔄 ⚡🔄 📚🔄 🏛️✅ │ 65% │ 8min left
```

### Convergence Countdown
```
🎯 CONVERGENCE COUNTDOWN
┌─────────────────────────────────────────────────────────────────────────┐
│ ⏱️  Waiting for streams to complete...                     ETA: 4:32     │
│                                                                         │
│ Ready:     🔧✅ 🏛️✅                                      │ 2/7 streams │
│ Working:   🧪🔄 🔒🔄 🎨🔄 ⚡🔄 📚🔄                        │ 5/7 streams │
│ Blocked:   (none)                                        │ 0/7 streams │
│                                                                         │
│ Next Complete: 🧪 SDET (Est: 2:15)                                      │
│ Slowest:       📚 Documentation (Est: 4:32)                             │
│                                                                         │
│ Overall: [████████████████████████████████░░░░░░░░░░] 75% Complete      │
└─────────────────────────────────────────────────────────────────────────┘
```

## Real-Time Progress Updates

### Update Animation Sequence
```
Frame 1: [████████████████████████▓▓▓▓░░░░░░░░░░░░░░░░] 63%
Frame 2: [████████████████████████▓▓▓▓▓░░░░░░░░░░░░░░░░] 64%
Frame 3: [████████████████████████▓▓▓▓▓▓░░░░░░░░░░░░░░░] 65%
Frame 4: [████████████████████████████▓▓░░░░░░░░░░░░░░░] 66%
```

### Persona Activity Indicators
```
🔧 SOFTWARE ENG   [████████████████████] 🔥 Implementing auth endpoints...
🧪 SDET           [██████████████▓▓▓▓▓▓] ⚡ Writing integration tests...
🔒 SECURITY ENG   [████████████████████] 🛡️  Running security scan...
🎨 UX DESIGNER    [████████████▓▓▓▓▓▓▓▓] 🎨 Creating responsive layouts...
⚡ PERFORMANCE     [████████▓▓▓▓▓▓▓▓▓▓▓▓] 📊 Load testing API endpoints...
📚 DOCUMENTATION  [██████▓▓▓▓▓▓▓▓▓▓▓▓▓▓] ✍️  Writing API documentation...
🏛️ ARCHITECT      [████████████████████] 📋 Updating architecture docs...
```

## Session Completion Display

### Success State
```
┌─────────────────────────────────────────────────────────────────────────┐
│                          🎉 SESSION COMPLETE! 🎉                        │
│                         Feature: User Authentication                     │
├─────────────────────────────────────────────────────────────────────────┤
│ Duration: 28 minutes │ Quality Score: 98/100 │ All Tests: ✅ PASSING    │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│ ✅ SOFTWARE ENG   [████████████████████████████████████████] 100% (18min)│
│ ✅ SDET           [████████████████████████████████████████] 100% (25min)│
│ ✅ SECURITY ENG   [████████████████████████████████████████] 100% (22min)│
│ ✅ UX DESIGNER    [████████████████████████████████████████] 100% (24min)│
│ ✅ PERFORMANCE    [████████████████████████████████████████] 100% (26min)│
│ ✅ DOCUMENTATION  [████████████████████████████████████████] 100% (28min)│
│ ✅ ARCHITECT      [████████████████████████████████████████] 100% (15min)│
│                                                                         │
│ 📊 Results:                                                             │
│    Code Coverage: 94%    Performance: <200ms    Security: A+ Rating     │
│    Tests: 47 passing     Bundle: 180KB          Accessibility: WCAG AA  │
│                                                                         │
│ 🚀 Ready for Deployment: https://auth-preview.myapp.com                 │
│ 📋 Pull Request: #42 - Add user authentication system                   │
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│ Next Steps: ✅ Approve PR → 🚀 Deploy Production → 📈 Monitor Metrics   │
└─────────────────────────────────────────────────────────────────────────┘
```

## Progress Bar Generation Functions

### Basic Progress Bar
```typescript
function generateProgressBar(
  percentage: number, 
  width: number = 40, 
  style: 'basic' | 'animated' | 'gradient' = 'basic'
): string {
  const filled = Math.floor((percentage / 100) * width);
  const empty = width - filled;
  
  switch (style) {
    case 'basic':
      return `[${'█'.repeat(filled)}${'░'.repeat(empty)}] ${percentage}%`;
    
    case 'animated':
      const working = Math.min(3, empty);
      const actualEmpty = empty - working;
      return `[${'▓'.repeat(filled)}${'▓'.repeat(working)}${'░'.repeat(actualEmpty)}] ${percentage}%`;
    
    case 'gradient':
      return `[${'█'.repeat(filled)}${'▒'.repeat(Math.min(2, empty))}${'░'.repeat(Math.max(0, empty-2))}] ${percentage}%`;
  }
}
```

### Stream Status Display
```typescript
function generateStreamStatus(streams: StreamInfo[]): string {
  const maxNameLength = Math.max(...streams.map(s => s.name.length));
  
  return streams.map(stream => {
    const name = stream.name.padEnd(maxNameLength);
    const icon = getStatusIcon(stream.status);
    const bar = generateProgressBar(stream.progress, 30, stream.status === 'working' ? 'animated' : 'basic');
    const time = stream.timeRemaining ? `${stream.timeRemaining}min` : 'Done';
    
    return `${icon} ${name} ${bar} ${time}`;
  }).join('\n');
}

function getStatusIcon(status: string): string {
  const icons = {
    'complete': '✅',
    'working': '🔄',
    'blocked': '⏸️',
    'failed': '❌',
    'waiting': '⏳',
    'ready': '🔔'
  };
  return icons[status] || '❓';
}
```

### Session Overview
```typescript
function generateSessionOverview(session: SessionInfo): string {
  const sessionProgress = generateProgressBar(session.overallProgress, 50);
  const timeDisplay = `${session.elapsed}/${session.total}min`;
  
  return `
┌─────────────────────────────────────────────────────────────────────────┐
│                    🎭 ORCHESTRATION SESSION v2.1                        │
│                         Feature: ${session.feature}                     │
├─────────────────────────────────────────────────────────────────────────┤
│ Session Progress: ${sessionProgress} │ ${timeDisplay} │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
${generateStreamStatus(session.streams)}
│                                                                         │
├─────────────────────────────────────────────────────────────────────────┤
│ 🎯 CONVERGENCE: ${session.convergenceStatus} │ ETA: ${session.eta} │ Ready: ${session.readyCount}/${session.totalStreams} │
└─────────────────────────────────────────────────────────────────────────┘`;
}
```

## Usage in Orchestrator

### Progress Reporting Protocol
```markdown
## Progress Reporting Requirements

Each persona MUST update their progress every 5 minutes by creating:
`.work/tasks/${taskId}/PROGRESS.json`

```json
{
  "task_id": "TASK-1234-impl",
  "persona": "software-engineer", 
  "progress": 65,
  "status": "working",
  "current_activity": "Writing authentication middleware",
  "time_remaining_estimate": 8,
  "blockers": [],
  "last_update": "2025-06-28T23:45:00Z"
}
```

### Orchestrator Display Logic
```typescript
// Every 30 seconds, orchestrator updates display
function updateProgressDisplay() {
  const allProgress = readAllProgressFiles();
  const sessionInfo = calculateSessionInfo(allProgress);
  
  console.clear();
  console.log(generateSessionOverview(sessionInfo));
  
  // Show mini progress in subsequent outputs
  console.log(generateMiniProgress(sessionInfo));
}
```

### Integration Points
1. **Orchestrator**: Displays main progress dashboard
2. **All Personas**: Report progress every 5 minutes
3. **Convergence**: Special convergence countdown display
4. **Validation**: Final completion celebration
5. **Error Recovery**: Error state visualization

## Animation & Updates

### Refresh Rate
- **Main Dashboard**: Every 30 seconds
- **Mini Progress**: Every output
- **Working Indicators**: Rotate every 10 seconds
- **Time Estimates**: Update every minute

### Visual Polish
- Use Unicode box-drawing characters for clean frames
- Consistent color coding (when supported)
- Responsive width based on terminal size
- Graceful degradation for limited terminals

---
*Visual progress tracking makes parallel orchestration feel alive and responsive!* 🎨✨
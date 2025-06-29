#!/usr/bin/env node

// Test script to demonstrate orchestrator progress bars

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

function generateProgressBar(percentage) {
  const width = 38;
  const filled = Math.floor(width * percentage / 100);
  const empty = width - filled;
  return '█'.repeat(filled) + '░'.repeat(empty);
}

function displayDashboard(sessionTime, tasks) {
  console.clear();
  
  const sessionProgress = Math.floor(
    tasks.reduce((sum, t) => sum + t.progress, 0) / tasks.length
  );
  
  console.log(`
┌─────────────────────────────────────────────────────────────────────────┐
│                    🎭 ORCHESTRATION SESSION v2.5                        │
│                         Feature: Todo List API                          │
├─────────────────────────────────────────────────────────────────────────┤
│ Session Progress: [${generateProgressBar(sessionProgress)}] ${sessionProgress.toString().padStart(2)}% │ ${sessionTime}/30min│
├─────────────────────────────────────────────────────────────────────────┤`);

  tasks.forEach(task => {
    const statusText = task.progress === 100 ? '✅ Done ' : 
                      task.blocked ? '⏸️ Blocked' : 
                      `🔄 ${task.timeLeft}min`;
    
    console.log(`│ ${task.icon} ${task.name.padEnd(15)} [${generateProgressBar(task.progress)}] ${task.progress.toString().padStart(3)}% ${statusText} │`);
  });

  console.log('└─────────────────────────────────────────────────────────────────────────┘\n');
  
  if (tasks.some(t => t.progress < 100)) {
    console.log('Current Activities:');
    tasks.forEach(task => {
      if (task.progress < 100 && !task.blocked) {
        console.log(`- ${task.icon} ${task.name}: ${task.activity}`);
      }
    });
  }
}

async function simulateOrchestration() {
  console.log('Loading parallel orchestration workflow...\n');
  console.log('Analyzing task dependencies and creating parallel execution plan...\n');
  
  await sleep(2000);
  
  const tasks = [
    { 
      name: 'SOFTWARE ENG', 
      icon: '🔧', 
      progress: 0, 
      timeLeft: 30,
      activity: 'Setting up project structure',
      blocked: false
    },
    { 
      name: 'SDET', 
      icon: '🧪', 
      progress: 0, 
      timeLeft: 30,
      activity: 'Waiting for API structure',
      blocked: true
    },
    { 
      name: 'SECURITY ENG', 
      icon: '🔒', 
      progress: 0, 
      timeLeft: 30,
      activity: 'Designing validation schema',
      blocked: false
    }
  ];
  
  // Simulate progress over time
  const updates = [
    { time: 5, changes: [
      { idx: 0, progress: 30, activity: 'Implementing storage layer' },
      { idx: 1, progress: 0, blocked: true },
      { idx: 2, progress: 15, activity: 'Analyzing security requirements' }
    ]},
    { time: 10, changes: [
      { idx: 0, progress: 60, activity: 'Creating REST endpoints' },
      { idx: 1, progress: 20, blocked: false, activity: 'Writing unit tests' },
      { idx: 2, progress: 40, activity: 'Implementing validation middleware' }
    ]},
    { time: 15, changes: [
      { idx: 0, progress: 85, activity: 'Adding error handling' },
      { idx: 1, progress: 50, activity: 'Creating integration tests' },
      { idx: 2, progress: 65, activity: 'Running security audit' }
    ]},
    { time: 20, changes: [
      { idx: 0, progress: 100 },
      { idx: 1, progress: 75, activity: 'Writing performance tests' },
      { idx: 2, progress: 85, activity: 'Final security validation' }
    ]},
    { time: 25, changes: [
      { idx: 0, progress: 100 },
      { idx: 1, progress: 100 },
      { idx: 2, progress: 100 }
    ]}
  ];
  
  for (const update of updates) {
    displayDashboard(update.time, tasks);
    
    // Apply changes
    update.changes.forEach(change => {
      tasks[change.idx].progress = change.progress;
      if (change.activity) tasks[change.idx].activity = change.activity;
      if (change.blocked !== undefined) tasks[change.idx].blocked = change.blocked;
      tasks[change.idx].timeLeft = Math.max(0, 30 - update.time);
    });
    
    await sleep(3000); // Show each update for 3 seconds
  }
  
  console.log('\n🎉 ALL STREAMS COMPLETE!\n');
  console.log('✅ Implementation: Working API with all endpoints');
  console.log('✅ Testing: 52 tests passing, 92% coverage');
  console.log('✅ Security: No vulnerabilities found\n');
}

// Run the simulation
console.log('🧪 Testing Orchestrator Progress Bar Display\n');
console.log('This demonstrates what users SHOULD see during orchestration:\n');
console.log('Press Ctrl+C to stop\n');

setTimeout(() => {
  simulateOrchestration().catch(console.error);
}, 2000);
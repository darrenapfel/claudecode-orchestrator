#!/usr/bin/env node

// Show a single progress bar snapshot

function generateProgressBar(percentage) {
  const width = 38;
  const filled = Math.floor(width * percentage / 100);
  const empty = width - filled;
  return '█'.repeat(filled) + '░'.repeat(empty);
}

console.log(`
┌─────────────────────────────────────────────────────────────────────────┐
│                    🎭 ORCHESTRATION SESSION v2.5                        │
│                         Feature: Todo List API                          │
├─────────────────────────────────────────────────────────────────────────┤
│ Session Progress: [${generateProgressBar(50)}] 50% │ 15/30min│
├─────────────────────────────────────────────────────────────────────────┤
│ 🔧 SOFTWARE ENG   [${generateProgressBar(85)}] 85% 🔄 5min  │
│ 🧪 SDET           [${generateProgressBar(40)}] 40% 🔄 15min │
│ 🔒 SECURITY ENG   [${generateProgressBar(60)}] 60% 🔄 10min │
└─────────────────────────────────────────────────────────────────────────┘

Current Activities:
- 🔧 SOFTWARE ENG: Finalizing error handling
- 🧪 SDET: Creating integration tests
- 🔒 SECURITY ENG: Running security audit
`);
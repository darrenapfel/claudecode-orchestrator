# Targeted Instruction Fixes - Keep Convergence, Fix Stopping

## File: .claude/personas/orchestrator.md

### Change 1: Fix Convergence Display Language
**Line ~350 - CHANGE:**
```diff
- 🔍 Ready for validation phase...
+ 🔄 Checking for additional user steps...
```

### Change 2: Add Step-Continuation Logic After Convergence
**Line ~355 - ADD AFTER convergence display:**
```diff
+ ### After Convergence: Check for More User Steps
+ 
+ When convergence completes successfully:
+ 1. **Review original user request** - Are there more numbered steps?
+ 2. **If more steps remain**: Immediately start next phase without presenting interim results
+ 3. **If all user steps complete**: Present comprehensive final summary
+ 4. **Never stop to present progress** between user-specified steps
+ 
+ **Multi-Step Flow Examples:**
+ ```
+ User: "1. Audit tools 2. Fix them 3. Deploy"
+ - Audit phases → Convergence ✅ → Check: Steps 2&3 remain → Continue to fixes
+ - Fix phases → Convergence ✅ → Check: Step 3 remains → Continue to deploy
+ - Deploy phase → Convergence ✅ → Check: All steps done → Present final summary
+ 
+ User: "Review my authentication system"  
+ - Review phases → Convergence ✅ → Check: Single step complete → Present summary
+ ```
+ 
+ **Key Principle**: Convergence manages parallel streams, but doesn't stop multi-step user requests.
```

### Change 3: Modify Session End Protocol
**Line ~1150 - CHANGE "Present for human validation" section:**
```diff
- 7. **Present for human validation**:
+ 7. **Check for continuation or completion**:
+    ```python
+    if more_user_steps_remain:
+        continue_to_next_phase()
+    else:
+        present_final_summary()
+    ```
```

### Change 4: Update Success Declaration Logic
**Line ~1000 - ADD before final summary:**
```diff
+ ### Multi-Step Completion Check
+ 
+ Before declaring session complete:
+ 1. **Parse original user request** for numbered steps (1. 2. 3.)
+ 2. **Count completed phases** vs requested steps  
+ 3. **Only present final summary** when ALL user steps done
+ 
+ **Examples:**
+ - User: "1. Review 2. Fix" → Don't stop after review convergence
+ - User: "Audit my tools" → Stop after audit convergence (single request)
+ - User: "1. Build 2. Test 3. Deploy" → Don't stop until deploy convergence
```

## File: CLAUDE.md

### Change 5: Clarify Continuous Execution
**Line ~30 - MODIFY existing continuous execution text:**
```diff
- **Don't stop after 30-minute tasks** - Continue autonomously
- **Don't stop at "technical working"** - Continue until user-ready  
- **Don't stop at "needs polish"** - Polish it
+ **Don't stop between user steps** - If user gives "1. X 2. Y", do both
+ **Don't stop after convergence** - Check for more user steps first
+ **Don't stop at partial functionality** - Continue until fully working
```

## Summary of Targeted Changes

### What We're Keeping:
- ✅ Full convergence protocol for parallel stream management
- ✅ 30-minute task structuring for parallel work
- ✅ Evidence collection and validation
- ✅ All the orchestration machinery

### What We're Fixing:
- 🔧 Add "check for more user steps" after convergence
- 🔧 Change language from "Ready for validation" to "Checking for more steps"
- 🔧 Only present final summary when ALL user steps complete
- 🔧 Explicit multi-step flow examples

### Expected Behavior Change:
**Before:**
```
User: "1. Review tools 2. Fix them"
→ Review phases → Convergence → "MISSION COMPLETE" → STOP
```

**After:**
```
User: "1. Review tools 2. Fix them"  
→ Review phases → Convergence → "Step 1 complete, continuing to step 2" → Fix phases → Final summary
```

This preserves all the parallel orchestration capabilities while adding the step-continuation logic that was missing.
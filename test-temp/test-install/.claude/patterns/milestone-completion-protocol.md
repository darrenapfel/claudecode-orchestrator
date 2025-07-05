# Milestone Completion Protocol

## Critical: Service Management Before Completion

**MANDATORY**: Orchestrator must start, validate, and provide working service URL to user.

### Orchestrator Service Management

The orchestrator MUST handle ALL service operations:

1. **Start Service**
   ```bash
   # Orchestrator starts the service in background
   npm run dev > service.log 2>&1 &
   SERVICE_PID=$!
   echo $SERVICE_PID > .service_pid
   sleep 15  # Allow startup time
   ```

2. **Validate Service is Running**
   ```bash
   # Verify service responds
   curl -f http://localhost:3000 > /dev/null 2>&1
   if [ $? -ne 0 ]; then
       echo "❌ SERVICE STARTUP FAILED"
       cat service.log
       # TRIGGER FIX CYCLE
   fi
   
   # Verify API responds
   curl -f http://localhost:3000/api/health > /dev/null 2>&1
   if [ $? -ne 0 ]; then
       echo "❌ API NOT RESPONDING"
       # TRIGGER FIX CYCLE
   fi
   ```

3. **Test Critical Functionality**
   ```bash
   # Test homepage loads without errors
   curl -s http://localhost:3000 | grep -q "<!DOCTYPE html"
   
   # Test API endpoint responds with valid JSON
   curl -s http://localhost:3000/api/health | jq '.' > /dev/null
   ```

### Service Startup Delegation

**@test-engineer** manages service startup and validation following the standard protocol.

**Reference**: See `.claude/patterns/SERVICE-MANAGEMENT.md` for complete procedures.

**Key Steps**:
1. Execute service startup protocol
2. Validate all service endpoints
3. Document service URL and evidence
4. **If any step fails → Create fix cycle immediately**

### Fix Cycle for Service Issues

**Reference**: See `.claude/patterns/SERVICE-MANAGEMENT.md` for failure handling protocol.

**Quick Summary**:
1. **STOP** - Do not claim milestone completion
2. **ANALYZE** - Review service logs using standard checklist
3. **FIX** - Create targeted fix tasks for identified issues
4. **RETRY** - Re-attempt service startup after fixes
5. **VALIDATE** - Only proceed when service is fully operational

## Milestone Completion Deliverables

When milestone validation passes AND smoke test passes:

### 1. Service is Running and Validated
**Orchestrator has already**:
- Started the service successfully
- Validated all endpoints respond
- Confirmed no startup errors
- **Service URL ready**: http://localhost:3000

### 2. Generated Documents
Orchestrator creates these documents in the current sprint directory:

#### A. MILESTONE-COMPLETION.md
```markdown
# Milestone [Milestone-Name] - Ready for User Testing

## Service Information
**Testing URL**: http://localhost:3000 ✅ RUNNING
**Environment**: Local development with mock services
**Status**: Service started and validated by orchestrator

## Key Documents
- **Milestone Summary**: [link to PROJECT-STATE.md]
- **User Stories for Testing**: [link to user-stories-testing-guide.md]
- **Feedback Form**: [link to USER-FEEDBACK-FORM.md]

## Testing Instructions

### Ready to Test!
✅ Service is already running at: **http://localhost:3000**
✅ All endpoints validated and responding
✅ No startup errors detected

**Just open the URL and start testing!**

### What to Test
Please test the user stories listed in [user-stories-testing-guide.md].
Focus on the critical user journeys and report any issues you encounter.

### Submitting Feedback
1. Fill out the feedback form: USER-FEEDBACK-FORM.md
2. Save the completed form
3. Tell Claude: "Please process the user feedback file"

## Technical Notes
- All external services are mocked for this milestone
- Database is SQLite with seed data
- Authentication is email/password only
- Performance targets: <2s page loads, <100ms interactions

## Success Criteria Met
✅ All user stories implemented
✅ All validation passes (test/product/performance/security)
✅ Smoke test confirms service runs properly
✅ >80% test coverage achieved
✅ No critical bugs detected

**Ready for user acceptance testing!**
```

#### B. USER-STORIES-TESTING-GUIDE.md
```markdown
# User Stories Testing Guide
**Milestone**: [Milestone-Name]
**Generated**: [Date]

## How to Use This Guide
Each user story below represents a complete user journey you should test.
Try to complete each story and note any problems in the feedback form.

## Critical User Stories

### Story 1: New User Registration
**As a new user, I want to create an account so I can access the service**

**Test Steps:**
1. Go to http://localhost:3000
2. Click "Sign Up" or "Register"
3. Fill out registration form with valid email/password
4. Submit the form
5. Verify account is created and you're logged in

**Expected Result**: You should be logged in and see the main dashboard

---

### Story 2: Topic Selection
**As a registered user, I want to select my topics of interest (max 3)**

**Test Steps:**
1. From the dashboard, find topic selection
2. Browse available topics (should be 20 across 5 categories)
3. Select up to 3 topics you're interested in
4. Save your selections

**Expected Result**: Your selected topics should be saved and displayed

---

[Continue with all user stories from foundation/product/user-stories.md]

## Testing Tips
- Test on different screen sizes if possible
- Try invalid inputs to see how errors are handled
- Check if the UI is intuitive - could a new user figure it out?
- Note any confusing language or unclear instructions

## What to Look For
- **Functionality**: Does everything work as expected?
- **Usability**: Is it easy to use and understand?
- **Performance**: Do pages load quickly?
- **Design**: Does it look professional and polished?
- **Errors**: Are error messages helpful?

**Don't hesitate to report small issues - they're easier to fix now!**
```

#### C. USER-FEEDBACK-FORM.md (Pre-filled Template)
```markdown
# User Feedback Report
**Milestone**: [Auto-filled: Current Milestone Name]
**Date**: [Auto-filled: Today's Date]
**Tester**: [Your name/email]
**Testing URL**: http://localhost:3000

## Issues Found
*Describe problems as you encounter them - natural language is fine*

### Issue 1: [Give it a short title]
**What I was trying to do:**
[Describe what you wanted to accomplish]

**What happened instead:**
[What actually occurred - be specific]

**Steps to reproduce:**
1. [Step 1]
2. [Step 2] 
3. [Problem occurs]

**Impact level:**
- [ ] Critical (Can't use the feature at all)
- [ ] Major (Feature works but has serious problems) 
- [ ] Minor (Small annoyance but workable)
- [ ] Cosmetic (Looks wrong but functions fine)

---

### Issue 2: [Title]
[Add more issues as needed - copy the format above]

---

## What Worked Well
*Tell us what you liked - we want to preserve these things*

## Suggestions for Improvement  
*Ideas for making it better, beyond just fixing bugs*

## User Story Testing Results
[Check off the stories you tested from USER-STORIES-TESTING-GUIDE.md]

- [ ] Story 1: New User Registration
- [ ] Story 2: Topic Selection
- [ ] Story 3: [etc...]

## Overall Assessment
**Would you actually use this product?** [Yes/No/Maybe - be honest]
**Most annoying problem:** [Which issue bothers you most?]
**Best feature:** [What did you like most?]
**Estimated completion:** [What % of planned features seem to work?]

## Technical Info (if relevant)
**Browser:** [Chrome/Safari/Firefox/etc]
**Screen size:** [Desktop/Laptop/Mobile/Tablet]
**Any error messages:** [Copy/paste if you saw any]

---

## Submit Instructions
1. Save this completed form as USER-FEEDBACK-FORM.md in the project root
2. Tell Claude: "Please process the user feedback file"
3. Claude will convert your feedback into structured test cases and fixes

**Thank you for testing! Your feedback directly improves the product quality.**
```

## Orchestrator Completion Announcement

When milestone is truly complete:

```
🎉 MILESTONE [NAME] COMPLETE - Ready for User Testing

✅ VALIDATION: All validators passed
✅ SMOKE TEST: Service confirmed running at http://localhost:3000
✅ DOCUMENTATION: All testing materials prepared

📋 TESTING MATERIALS CREATED:
   - MILESTONE-COMPLETION.md (overview and instructions)
   - USER-STORIES-TESTING-GUIDE.md (what to test)
   - USER-FEEDBACK-FORM.md (pre-filled feedback form)

🚀 USER TESTING INSTRUCTIONS:
   1. Start service: npm run dev
   2. Test user stories in testing guide
   3. Fill out feedback form with any issues
   4. Submit feedback: "Please process the user feedback file"

📊 MILESTONE METRICS:
   - User Stories: [X]/[Y] implemented (100%)
   - Test Coverage: [%] (target: >80%)
   - Performance: [metrics vs targets]
   - Critical Issues: 0 detected

Ready for user acceptance testing!
```

## Integration with Sprint Structure

These documents are created in the final sprint directory:
```
.work/milestones/YYYYMMDD-milestone-name/sprint-XXX/
├── completion/
│   ├── MILESTONE-COMPLETION.md
│   ├── USER-STORIES-TESTING-GUIDE.md
│   └── USER-FEEDBACK-FORM.md
└── validation-final/
    └── smoke-test-results.md
```

## Quality Gates

1. **Technical Validation**: All 4 validators pass
2. **Service Validation**: Smoke test confirms service runs
3. **Documentation**: All testing materials generated
4. **Evidence**: All claims backed by reproducible proof

Only after ALL gates pass can milestone be declared complete.

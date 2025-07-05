# UI Validation Protocol

## Context
This validation runs as part of the 4-validator parallel process after Integration Step.

## Purpose
UI validation ensures the user interface is functional, accessible, performant, and provides excellent user experience across all devices.

## Required Evidence for UI Tasks

### 1. Visual Proof
Capture screenshots at standard resolutions with visible timestamps:

**Desktop (1920x1080)**
```bash
# Include browser dev tools showing:
- Console tab (must show zero errors)
- Network tab (showing API calls)
- Performance metrics
- Timestamp visible
```

**Tablet (768x1024 - iPad)**
```bash
# Both orientations:
- Portrait mode
- Landscape mode
- Touch targets appropriately sized
```

**Mobile (375x667 - iPhone SE)**
```bash
# Critical mobile checks:
- No horizontal scroll
- Text readable without zoom
- Buttons/links tappable (44x44px min)
- Forms usable with virtual keyboard
```

### 2. Console Verification
Zero errors policy - any console error = FAIL:

```javascript
// Run in browser console before screenshot
console.clear();
// Perform user actions
console.log('Errors found:', console.error.length || 0);
console.log('Warnings:', console.warn.length || 0);
console.log('React errors:', !!document.querySelector('[class*="error"]'));
console.log('Timestamp:', new Date().toISOString());
```

### 3. Interaction Testing
Test all interactive elements:

```markdown
## Interaction Checklist
- [ ] All buttons clickable
- [ ] Forms submit correctly
- [ ] Dropdowns open/close
- [ ] Modals accessible
- [ ] Tabs keyboard navigable
- [ ] Links have hover states
- [ ] Loading states shown
- [ ] Error states displayed
- [ ] Success feedback clear
- [ ] Animations smooth (60fps)
```

### 4. Accessibility Validation
WCAG AA compliance required:

```bash
# Automated accessibility scan
axe-core browser extension results:
- Critical issues: 0 ✅
- Serious issues: 0 ✅
- Moderate issues: 0 ✅
- Minor issues: 2 ⚠️ (documented)

# Manual checks:
- Keyboard navigation ✅
- Screen reader tested ✅
- Color contrast (4.5:1 minimum) ✅
- Focus indicators visible ✅
- Alt text present ✅
- ARIA labels correct ✅
```

### 5. Cross-Browser Testing
Test in major browsers:

```markdown
## Browser Compatibility
- Chrome 120+ ✅
- Firefox 120+ ✅
- Safari 17+ ✅
- Edge 120+ ✅
- Mobile Safari (iOS 17+) ✅
- Chrome Mobile (Android 13+) ✅

## Features Working:
- Layout consistent ✅
- Animations smooth ✅
- Forms functional ✅
- No browser-specific bugs ✅
```

### 6. Performance Metrics
Measure actual performance:

```javascript
// Lighthouse scores (mobile)
Performance: 95/100 ✅
Accessibility: 100/100 ✅
Best Practices: 100/100 ✅
SEO: 100/100 ✅

// Core Web Vitals
LCP: 1.2s ✅ (< 2.5s)
FID: 45ms ✅ (< 100ms)
CLS: 0.05 ✅ (< 0.1)

// Load times
Initial load: 1.8s ✅
Route change: 200ms ✅
API response render: 150ms ✅
```

### 7. Responsive Design
Verify responsive behavior:

```markdown
## Breakpoint Testing
- Mobile (320-767px): ✅ Single column
- Tablet (768-1023px): ✅ Two column
- Desktop (1024px+): ✅ Full layout

## Content Reflow
- Text wraps properly ✅
- Images scale correctly ✅
- Tables scroll horizontally ✅
- Navigation collapses ✅
```

## UI Evidence Format

```markdown
# UI Validation Evidence

**Sprint**: Sprint-XXX
**Component**: [Component Name]
**Validator**: @test-engineer
**Validation Time**: YYYY-MM-DD HH:MM:SS

## Visual Evidence

### Desktop View (1920x1080)
![Desktop](./artifacts/desktop-20250703-143022.png)
- Console: 0 errors ✅
- Network: All 200s ✅
- Render time: 1.2s ✅

### Mobile View (375x667)
![Mobile](./artifacts/mobile-20250703-143122.png)
- Touch targets: 48x48px ✅
- No horizontal scroll ✅
- Keyboard shows properly ✅

## Interaction Testing
- Login form: Functions correctly ✅
- Navigation: All links work ✅
- Modals: Open/close properly ✅
- Data tables: Sort/filter work ✅
- Forms: Validation displays ✅

## Accessibility Audit
- Automated: 0 critical issues ✅
- Keyboard: Fully navigable ✅
- Screen reader: Tested with NVDA ✅
- Color contrast: 4.5:1 minimum ✅

## Performance Metrics
- Lighthouse: 95/100/100/100 ✅
- LCP: 1.2s ✅
- No layout shifts ✅
- 60fps animations ✅

## Browser Testing
✅ Chrome: Full functionality
✅ Firefox: Full functionality
✅ Safari: Full functionality
✅ Mobile browsers: Optimized
```

## Common UI Failures

❌ **Console errors**: Any error = automatic fail
❌ **Horizontal scroll**: Mobile viewport broken
❌ **Small touch targets**: Buttons under 44x44px
❌ **Missing loading states**: User sees nothing happening
❌ **No error feedback**: User doesn't know what went wrong
❌ **Inaccessible**: Keyboard traps, missing alt text
❌ **Poor contrast**: Text unreadable
❌ **Layout shifts**: Content jumps around (CLS > 0.1)
❌ **Slow interactions**: >100ms response time
❌ **Browser-specific bugs**: Works in Chrome only

## UI Validation Checklist

### Visual
- [ ] Desktop screenshot with dev tools
- [ ] Tablet screenshot both orientations
- [ ] Mobile screenshot with keyboard
- [ ] All screenshots timestamped
- [ ] Console shows zero errors

### Functionality
- [ ] All interactive elements tested
- [ ] Forms validate and submit
- [ ] Navigation works correctly
- [ ] Data displays accurately
- [ ] Error states handled

### Accessibility
- [ ] Keyboard fully navigable
- [ ] Screen reader compatible
- [ ] Color contrast passes
- [ ] Focus indicators visible
- [ ] ARIA labels present

### Performance
- [ ] Lighthouse scores acceptable
- [ ] Core Web Vitals pass
- [ ] Animations 60fps
- [ ] No janky scrolling

### Compatibility
- [ ] Chrome tested
- [ ] Firefox tested
- [ ] Safari tested
- [ ] Mobile browsers tested
- [ ] No browser-specific issues

## Sprint Context

UI validation ensures user-facing features work correctly:
- After Implementation Batch: Validate new UI components
- After Integration: Validate UI integrates with backend
- Before Deployment: Final UI polish check

---
*UI validation ensures users have a delightful, accessible experience.*

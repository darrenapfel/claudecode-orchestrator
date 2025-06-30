# UI Validation Protocol

## Required Evidence for UI Tasks

### 1. Visual Proof
- Desktop view (1920x1080)
- Tablet view (768x1024)  
- Mobile view (375x667)
- Console tab showing zero errors
- Network tab showing API calls

### 2. Console Verification
```javascript
// Run in browser console
console.log('Errors:', window.__errors || []);
console.log('React errors:', \!\!document.querySelector('#react-error-overlay'));
```

### 3. Common UI Failures
- Any console errors
- Horizontal scroll on mobile
- Buttons not clickable
- Missing loading states
- No error handling

## UI Task Evidence Template
```markdown
# UI Task Evidence
## Visual Evidence
- Desktop: ./artifacts/desktop.png ✅
- Mobile: ./artifacts/mobile.png ✅
- Console: Clean ✅
```

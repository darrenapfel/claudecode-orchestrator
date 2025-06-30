import { test, expect } from '@playwright/test';

test.describe('E2E Validation Suite', () => {
  test('homepage loads without errors', async ({ page }) => {
    // Listen for console errors
    const errors: string[] = [];
    page.on('console', msg => {
      if (msg.type() === 'error') {
        errors.push(msg.text());
      }
    });

    // Navigate to app
    await page.goto('http://localhost:3000');
    
    // Wait for content
    await page.waitForLoadState('networkidle');
    
    // Check for errors
    expect(errors).toHaveLength(0);
    
    // Take screenshot for evidence
    await page.screenshot({ path: 'evidence/homepage.png' });
  });

  test('critical user journey', async ({ page }) => {
    await page.goto('http://localhost:3000');
    
    // Example: Login flow
    await page.fill('[data-testid="email"]', 'test@example.com');
    await page.fill('[data-testid="password"]', 'password123');
    await page.click('[data-testid="login-button"]');
    
    // Verify navigation
    await expect(page).toHaveURL(/.*dashboard/);
    
    // Screenshot dashboard
    await page.screenshot({ path: 'evidence/dashboard.png' });
  });

  test('responsive design check', async ({ page }) => {
    const viewports = [
      { width: 1920, height: 1080, name: 'desktop' },
      { width: 768, height: 1024, name: 'tablet' },
      { width: 375, height: 667, name: 'mobile' }
    ];

    for (const viewport of viewports) {
      await page.setViewportSize({ width: viewport.width, height: viewport.height });
      await page.goto('http://localhost:3000');
      await page.screenshot({ path: `evidence/responsive-${viewport.name}.png` });
    }
  });

  test('api integration check', async ({ page, request }) => {
    // Test API directly
    const response = await request.get('http://localhost:3000/api/health');
    expect(response.ok()).toBeTruthy();
    
    // Test API from UI
    await page.goto('http://localhost:3000');
    const apiData = await page.evaluate(async () => {
      const res = await fetch('/api/data');
      return res.json();
    });
    
    expect(apiData).toBeDefined();
  });
});
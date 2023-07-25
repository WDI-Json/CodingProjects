const { test, expect } = require("@playwright/test")

test.beforeEach(async ({ page }) => {
  await page.goto("http://localhost:3000/")
})

const testUser = {
  email: "Wouter",
  password: "123456",
}

test.describe("Navigating the site", () => {
  test("Has title", async ({ page }) => {
    await page.goto("http://localhost:3000/")

    await expect(page).toHaveTitle("Support Desk")
  })

  test("", async ({ page }) => {
    await page.goto("http://localhost:3000/login")

    await expect(page).toHaveURL(/login/)
  })
})

test.describe("Authentication", () => {
  test("Logging in", async ({ page }) => {
    await page.goto("http://localhost:3000/")
    await page.getByRole("link", { name: "Login" }).click()
    await page.getByPlaceholder("Enter your email").fill(testUser.email)
    await page.getByPlaceholder("Enter your password").fill(testUser.password)
    await page.getByRole("button", { name: "Submit" }).click()

    await expect(page).toHaveURL(/login/)
  })
})

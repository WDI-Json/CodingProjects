const { test, expect } = require("@playwright/test")
import { setTimeout } from "timers/promises"

const landingPage = "http://localhost:3000/"
const testUser = {
  email: "wouter@mail.com",
  password: "123456",
}

test.beforeEach(async ({ page }, testInfo) => {
  console.log(`Running ${testInfo.title}`)
  await page.goto(landingPage)
})

test.describe("Accessibility", () => {
  test("Has title", async ({ page }) => {
    await page.goto(landingPage)
    await expect(page).toHaveTitle("Support Desk")
  })
})

test.describe("Login", () => {
  test("Land through URL", async ({ page }) => {
    await page.goto(landingPage + "login")
    expect(page.url()).toBe(landingPage + "login")
  })

  test("Land by button", async ({ page }) => {
    await page.getByRole("link", { name: "Login" }).click()
    expect(page.url()).toBe(landingPage + "login")
  })

  test("Successful lowercase", async ({ page }) => {
    await page.goto(landingPage)
    await page.getByRole("link", { name: "Login" }).click()
    await page.getByPlaceholder("Enter your email").fill(testUser.email)
    await page.getByPlaceholder("Enter your password").fill(testUser.password)
    await page.getByRole("button", { name: "Submit" }).click()
    await page.waitForURL(landingPage)
    await expect(page.url()).toBe(landingPage)
  })

  test("Successful uppercase", async ({ page }) => {
    await page.goto(landingPage)
    await page.getByRole("link", { name: "Login" }).click()
    await page
      .getByPlaceholder("Enter your email")
      .fill(testUser.email.toUpperCase())
    await page.getByPlaceholder("Enter your password").fill(testUser.password)
    await page.getByRole("button", { name: "Submit" }).click()
    await page.waitForURL(landingPage)
    await expect(page.url()).toBe(landingPage)
  })

  test("Failed", async ({ page }) => {
    await page.goto(landingPage)
    await page.getByRole("link", { name: "Login" }).click()
    await page.getByPlaceholder("Enter your email").fill(testUser.email)
    await page
      .getByPlaceholder("Enter your password")
      .fill(testUser.password + "gibberish")
    await page.getByRole("button", { name: "Submit" }).click()
    await setTimeout(500)
    expect(page.url()).toBe(landingPage + "login")
  })
})

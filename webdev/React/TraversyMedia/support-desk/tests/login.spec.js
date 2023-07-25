const { test, expect } = require("@playwright/test")
import { setTimeout } from "timers/promises"

const landingPage = "http://localhost:3000/"
const testUser = {
  email: "wouter@mail.com",
  password: "123456",
}

async function loginWith(page, email, password) {
  await page.getByRole("link", { name: "Login" }).click()

  await page.getByPlaceholder("Enter your email").fill(email)
  await page.getByPlaceholder("Enter your password").fill(password)

  await page.getByRole("button", { name: "Submit" }).click()
}

test.beforeEach(async ({ page }, testInfo) => {
  console.log(`Running ${testInfo.title}`)
  await page.goto(landingPage)
})

test.describe("Accessibility", () => {
  test("Has title", async ({ page }) => {
    await expect(page).toHaveTitle("Support Desk")
  })
})

test.describe("Login", () => {
  test("Land on the login page by going straight to the /login", async ({
    page,
  }) => {
    await page.goto(landingPage + "login")
    expect(page.url()).toBe(landingPage + "login")
  })

  test("Land on the loginpage by clicking the login button", async ({
    page,
  }) => {
    await loginWith(page, testUser.email, testUser.password)
    expect(page.url()).toBe(landingPage + "login")
  })

  test("Succesful login should redirect to main page", async ({ page }) => {
    await loginWith(page, testUser.email, testUser.password)
    await page.waitForURL(landingPage)
    expect(page.url()).toBe(landingPage)
  })

  test("Succesful login should be case-insensitive", async ({ page }) => {
    await loginWith(page, testUser.email.toUpperCase(), testUser.password)
    await page.waitForURL(landingPage)
    expect(page.url()).toBe(landingPage)
  })

  test("Invalid credentials given should not redirect to main page", async ({
    page,
  }) => {
    await loginWith(page, testUser.email, testUser.password + "gibberish")
    expect(page.url()).toBe(landingPage + "login")
  })
})

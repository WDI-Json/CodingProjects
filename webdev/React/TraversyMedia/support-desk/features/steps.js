const { Given, When, Then } = require("@cucumber/cucumber")

const landingPage = "http://localhost:3000/"
const testUser = {
  email: "wouter@mail.com",
  password: "123456",
}

// ? Given Bob opens support-desk website
// Undefined. Implement with the following snippet:

Given("Bob opens support-desk website", async function () {
  await page.goto(landingPage)
})

// ? And navigates to /login
// Undefined. Implement with the following snippet:

Given("navigates to \\/login", async function () {
  await page.getByRole("link", { name: "Login" }).click()
})

// ? When he has filled in correct credentials
// Undefined. Implement with the following snippet:

When("he has filled in correct credentials", async function () {
  await page.getByPlaceholder("Enter your email").fill(email)
  await page.getByPlaceholder("Enter your password").fill(password)
})

// ? Then Bob is navigated to the homepage
// Undefined. Implement with the following snippet:

Then("Bob is navigated to the homepage", async function () {
  await page.getByRole("button", { name: "Submit" }).click()
})

// ? And is able to view his tickets
// Undefined. Implement with the following snippet:

Then("is able to view his tickets", function () {
  // Write code here that turns the phrase above into concrete actions
  return "pending"
})

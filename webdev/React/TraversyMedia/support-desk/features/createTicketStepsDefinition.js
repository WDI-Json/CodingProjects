const { Given, When, Then } = require("@cucumber/cucumber")
const { expect } = require("@playwright/test")
const baseUrl = "http://localhost:3000/"

Given("Alex is logged in and on the main page", async function () {
  await this.openUrl(baseUrl)
  await this.page.getByRole("link", { name: "Login" }).click()
  await this.page.getByPlaceholder("Enter your email").fill("wouter@mail.com")
  await this.page.getByPlaceholder("Enter your password").fill("123456")
  await this.page.getByRole("button", { name: "Submit" }).click()
  await this.page.getByRole("alert")
  await this.page.locator('[id="\\32 "]')

  if (!this.page.getByText("invalid credentials")) {
    await this.page.waitForURL(baseUrl)
    expect(this.page.url()).toBe(baseUrl)
  } else {
    await this.page.getByLabel("close").click()
  }
})

When("Alex clicks on the {string} button", function (string) {
  // Write code here that turns the phrase above into concrete actions
  return "pending"
})

When("Alex should be taken to the ticket creation page", function () {
  // Write code here that turns the phrase above into concrete actions
  return "pending"
})

When("Alex fills in fields and submits the ticket", function () {
  // Write code here that turns the phrase above into concrete actions
  return "pending"
})

Then("Alex should see an alert-message\\/succes-message", function () {
  // Write code here that turns the phrase above into concrete actions
  return "pending"
})

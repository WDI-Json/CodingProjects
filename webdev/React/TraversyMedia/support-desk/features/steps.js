const { Given, When, Then } = require("@cucumber/cucumber")
const { test, expect } = require("@playwright/test")

const landingPage = "http://localhost:3000/"
const testUser = {
  email: "wouter@mail.com",
  password: "123456",
}

Given("Bob opens support-desk website", async function () {
  await this.openUrl(landingPage)
})

Given("goes to loginpage", async function () {
  await this.page.getByRole("link", { name: "Login" }).click()
})

When("he has filled in correct credentials", async function () {
  await this.page.getByPlaceholder("Enter your email").fill(testUser.email)
  await this.page
    .getByPlaceholder("Enter your password")
    .fill(testUser.password)
})

Then("Bob is navigated to the homepage", async function () {
  await this.page.getByRole("button", { name: "Submit" }).click()
})

Then("is able to view his tickets", async function () {
  await this.page.getByRole("link", { name: "View my Tickets" }).click()
  expect(this.page.url()).toBe(landingPage + "tickets")
})

const { Given, When, Then } = require("@cucumber/cucumber");
const { expect } = require("@playwright/test");

const baseUrl = "http://localhost:3000/";

Given("Bob is logged in", async function () {
  await this.openUrl(baseUrl);
  await this.page.getByRole("link", { name: "Login" }).click();
  await this.page.getByPlaceholder("Enter your email").fill("wouter@mail.com");
  await this.page.getByPlaceholder("Enter your password").fill("123456");
  await this.page.getByRole("button", { name: "Submit" }).click();
  await this.page.getByRole("alert");
  await this.page.locator('[id="\\32 "]');

  if (!this.page.getByText("invalid credentials")) {
    await this.page.waitForURL(baseUrl);
    expect(this.page.url()).toBe(baseUrl);
  } else {
    await this.page.getByLabel("close").click();
  }
});

When("he clicks logout", async function () {
  await this.page.getByRole("button", { name: "Logout" }).click();
});

Then("he is not able to look at his tickets", async function () {
  await this.page.waitForURL(baseUrl);
  await this.page.getByRole("link", { name: "View my Tickets" }).click();
  expect(this.page.url()).toBe(baseUrl);
});

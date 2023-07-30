const { Given, When, Then } = require("@cucumber/cucumber");
const { expect } = require("@playwright/test");

const baseUrl = "http://localhost:3000/";

Given("Bob opens support-desk website", async function () {
  await this.openUrl(baseUrl);
});

Given("goes to loginpage", async function () {
  await this.page.getByRole("link", { name: "Login" }).click();
});

When(
  "he has entered username {string} and password {string}",
  async function (email, password) {
    await this.page.getByPlaceholder("Enter your email").fill(email);
    await this.page.getByPlaceholder("Enter your password").fill(password);
  }
);

When("clicks the submit button", async function () {
  await this.page.getByRole("button", { name: "Submit" }).click();
  expect(this.page.url()).toBe(baseUrl + "login");
});

Then("sees if he was succesfull", async function () {
  await this.page.getByRole("alert");
  await this.page.locator('[id="\\32 "]');

  if (!this.page.getByText("invalid credentials")) {
    await this.page.waitForURL(baseUrl);
    expect(this.page.url()).toBe(baseUrl);
  }
});

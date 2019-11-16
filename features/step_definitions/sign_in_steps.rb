# I have to manually destroy user session, because:
# - Default Capybara webdriver RackTest doesn't clear after each scenario
# - Selenium Driver has conflict with testing Devise Auth(RSpec can be configured to deal with it)
# But not the Cucumber-Rails
Given('There is an administrator') do
  @admin = FactoryBot.create :administrator
end

When('I sign as an administrator with correct credentials') do
  SignInForm.fill_in_with(
    email: @admin.email,
    password: @admin.password
  ).submit
end

Then('It must show dashboard') do
  expect(page).to have_current_path('/en/dashboard')
end

Then('Page must contain welcome message for administrator') do
  expect(page).to have_content("Welcome #{@admin.role.name}, #{@admin.first_name}")
  visit destroy_user_session_url
end

Given('There is a user') do
  @user = FactoryBot.create :user
end

When('I am sign as an user with correct credentials') do
  SignInForm.fill_in_with(
    email: @user.email,
    password: @user.password
  ).submit
end

Then('Page must contain welcome message for user') do
  expect(page).to have_content("Welcome #{@user.role.name}, #{@user.first_name}")
  visit destroy_user_session_url
end

Given('There is no person with this credentials') do
  @anonym = FactoryBot.attributes_for :user
end

When('I try to sign in with this credentials') do
  SignInForm.fill_in_with(
    email: @anonym[:email],
    password: @anonym[:password]
  ).submit
end

Then('Page must contain warning about wrong credentials') do
  expect(page).to have_content('Invalid Email or password')
end

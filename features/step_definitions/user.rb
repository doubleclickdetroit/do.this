def create_user
  @email, @password = 'foo@bar.com', 'asdfasdf'
  @user = User.create email: @email, password: @password
end

def log_in(user)
  visit new_user_session_path
  fill_in 'Email',    with: @email
  fill_in 'Password', with: @password
  begin
    click_button 'Sign in'
  rescue
    # TODO terrible...
    page.execute_script("$('form#new_user').submit()")
  end
end

Given /^there (is|are) (\d+) Users?$/ do |_, num|
  User.count.should == num.to_i
end

Given /^I have already registered$/ do
  create_user
end

Given /^(I'm|I am) logged in$/ do |_|
  log_in(create_user)
end

Given /^(I'm|I am) on the homepage$/ do |_|
  visit '/'
end

When /^I visit the homepage$/ do
  visit '/'
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, value|
  @last_fill_in_value = value
  fill_in field, with: value
end

When /^I fill in my credentials$/ do
  fill_in 'Email',    with: @email
  fill_in 'Password', with: @password
end

When /^I click "(.*?)"$/ do |link|
  click_link link
end

When /^I press "(.*?)"$/ do |button|
  click_button button
end

Then /^I should see "(.*?)"$/ do |content|
  page.should have_content(content)
end

Then /^I should not see "(.*?)"$/ do |content|
  page.should_not have_content(content)
end

Then /^there should be (\d+) (new )?Users?$/ do |num, _|
  User.count.should == num.to_i
end


Given /^I am signed in as an (.*)$/ do |user_type|
  user = Factory.create(user_type.to_sym)
  @user = login_as(user, :scope => user_type.to_sym)
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content content
end


Given /^I am signed in as an (.*)$/ do |user_type|
  user_type = "usuario_#{user_type}".to_sym
  @user = Factory.create(user_type)
end

Then /^I should see "([^"]*)"$/ do |content|
  page.should have_content content
end


Given /^I am not authenticated$/ do
  # yay!
end

Then /^I should remain unauthenticated$/ do
  response.should_not be_successful
  response.should have_xpath("//div[@class='error']")
end

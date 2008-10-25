Given /^no (.*) with (.*) "(.*)" exists$/ do |resource, filter, name|
  @filters = { filter => name }
  (r = find_resource(resource, filter => name)) && r.destroy
end

Then /^I should be at the (.*)'s page$/ do |resource|
  r = find_resource(resource, @filters)
  
  r.should_not be nil
  response.url.split('?')[0].should == url(resource.to_sym, r.id)
end

def find_resource(resource, filters)
  Kernel::const_get(resource.underscore.classify).first(filters)
end

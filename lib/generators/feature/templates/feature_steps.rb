# Add your steps here
#
# A few examples:
#
# Given %r{^I was registered with ([^/\s]+)/(\S+)}i do |email, password|
#   @current_person = Person.generate(:email => email, :password => password))
# end
#
# Given %r{^I am authenticated as ([^/\s]+)/(\S+)}i do |email, password|
#   Given %{I was registered with #{email}/#{password}}
#   Then %{I can log in as #{email}/#{password}}  
# end
#
# Then %r{^I can log in as ([^/\s]+)/(\S+)}i do |email, password|
#   When %{I try to log in as #{email}/#{password}}
#   Then %{I should be redirected to /dashboard}
# end
#
# Then %r{^I can not log in as ([^/\s]+)/(\S+)}i do |email, password|
#   When %{I try to log in as #{email}/#{password}}
#   Then %{I should be redirected to /sessions}
#   And %{I should see "Wrong e-mail or password!"}
# end
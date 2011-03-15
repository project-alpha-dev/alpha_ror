Given /^I am not signed in$/ do
  # need to clear cookie here
end

Then /^I should be redirected to (.+)$/ do |page_name|

  #request.headers['HTTP_REFERER'].should_not be_nil
  #request.headers['HTTP_REFERER'].should_not == request.request_uri
  Then "I should be on #{page_name}"
end

Then /^I should receive a confirmation email at "([^"]*)"$/ do |addr|
  delivered_emails = ActionMailer::Base.deliveries
  the_mail = delivered_emails.select{|mail| mail.to.include? addr}.first
  the_mail.should contain("You can confirm your account through the link below")
  
end


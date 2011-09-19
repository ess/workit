Given /^I start the task "([^"]*)"$/ do |arg1|
  Given "I run `workit start #{arg1}`"
end

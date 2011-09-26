Given /^I start the task "([^"]*)"$/ do |arg1|
  Given "I run `workit start #{arg1}`"
end

Given /^I finish the current task$/ do
  Given "I run `workit finish`"
end

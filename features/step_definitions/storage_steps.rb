Then /^there should be a task described by "([^"]*)"$/ do |description|
  Workit::Model.setup
  Workit::Model::Task.first(:description => description).should_not be_nil
end

Given 'there are no tasks' do
  FileUtils.rm_f '/tmp/workit_test.db'
end

Then /^the task list contains (\d+) task$/ do |numtasks|
  Workit::Model.setup
  Workit::Model::Task.count.should == numtasks.to_i
end

require 'highline/import'

Given /^I am on the login page$/ do
  @page = LoginPage.new(@browser)
  @page.visit
end

When /^I login as user$/ do
  email = @settings["email"]
  password = @settings["password"]
  git_repo_uri = @settings["git_repo_uri"]
  application_name = "#{@settings["application_name"]}#{Random.rand(1000)}"
  application_type = @settings["application_type"] 
  environment_name = "#{@settings["environment_name"]}#{Random.rand(10000)}"
  framework_environment = @settings["framework_environment"] 
  application_stack = @settings["application_stack"] 
  runtime = @settings["runtime"] 
  domain_name = @settings["domain_name"] 
  region = @settings["region"] 
  database_stack = @settings["database_stack"]
  database_backup_interval = @settings["database_backup_interval"]
  database_backup_window = @settings["database_backup_window"] 
  snapshot_limit = @settings["snapshot_limit"]
  stack = @settings["stack"]
  
  @page = @page.login_user(email,password)
  @page = @page.add_new_application
  sleep 3
  @page = @page.create_application(git_repo_uri, application_name, application_type)
  @page = @page.create_new_environment(environment_name, framework_environment, application_stack, runtime, domain_name, region, database_stack, database_backup_interval, database_backup_window, snapshot_limit, stack)
  @page.add_single_instance
end

Then /^I win$/ do
  sleep 5
end

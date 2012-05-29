class ApplicationNewPage < BaseClassPage

  text_field(:git_repo_uri, :id => "app_repository_uri")
  text_field(:application_name, :id => "app_name")

  select_list(:application_type, :id => "app_app_type_id")

  button(:create_application_button, :class => "action submit")

  def create_application(git_repo_uri, application_name, application_type)
    self.git_repo_uri = git_repo_uri
    self.application_name = application_name
    self.application_type = application_type
    self.create_application_button
    EnvironmentNewPage.new @browser
  end

end

class DashboardPage < BaseClassPage

  link(:new_application_button, :id => "new_application")


  def add_new_application
    self.new_application_button
    ApplicationNewPage.new @browser
  end
end

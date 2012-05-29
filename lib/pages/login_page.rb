class LoginPage < BaseClassPage
  text_field(:email, :id => 'email')
  text_field(:password, :id => 'password')

  button(:sign_in, :value => 'Log in')

  def visit
    @browser.goto BASE_URL
  end

  def login_user(email, password)
    self.email = email
    self.password = password
    self.sign_in
    DashboardPage.new(@browser)
  end
end

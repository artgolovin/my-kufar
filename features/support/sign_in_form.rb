class SignInForm
  include Capybara::DSL

  def visit_page
    visit('/')
    click_link_or_button('Sign in')
    self
  end

  def fill_in_with(creds = {})
    fill_in 'Email', with: creds[:email]
    fill_in 'Password', with: creds[:password]
    self
  end

  def submit
    click_link_or_button 'Submit'
    self
  end
end

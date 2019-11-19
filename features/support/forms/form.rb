module Form
  include Capybara::DSL

  def submit
    click_link_or_button 'Submit'
  end
end

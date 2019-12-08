require 'rails_helper'

feature 'Creating advertisement', type: :feature do
  given (:user) { FactoryBot.create :user }
  given (:advertisement) { FactoryBot.attributes_for :advertisement }
  given! (:adver_type) { FactoryBot.create :adver_type, name: :cars }

  scenario 'user creates new advertisement' do
    visit '/'
    click_link_or_button 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_link_or_button 'Submit'

    visit '/en/dashboard'
    click_link_or_button 'Create New Advertisement'
    fill_in 'advertisement_title', with: advertisement[:title]
    fill_in 'advertisement_description', with: advertisement[:description]
    choose adver_type.name
    click_link_or_button 'Submit'

    visit '/en/dashboard'
    click_link_or_button 'Draft'

    expect(page).to have_content(advertisement[:title])
  end
end

require 'rails_helper'

feature "Always show admin's message on home page", type: :feature do

  shared_examples "contains admin's message" do
    scenario 'visiting home page' do
      visit '/'
      expect(page).to have_content(I18n.t '.warning')
      expect(page).to have_content(I18n.t '.title')
      expect(page).to have_content(I18n.t '.description')
    end
  end

  context 'Home Page with advertisements' do
    FactoryBot.create_list(:advertisement, 5)
    FactoryBot.create_list(:hidden_advertisement, 5)

    it_behaves_like "contains admin's message"
  end

  context 'Home Page without published advertisements' do
    Advertisement.where(status: :published).destroy_all

    it_behaves_like "contains admin's message"
  end
end

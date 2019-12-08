require 'rails_helper'
require_relative './shared_examples/ads/allowed'
require_relative './shared_examples/ads/denied'

RSpec.describe AdsController, type: :controller do
  let!(:user) { FactoryBot.create :user }
  let!(:administrator) { FactoryBot.create :administrator }
  let!(:published_advertisement) { FactoryBot.create :advertisement, user_id: user.id }
  let!(:draft_advertisement) { FactoryBot.create :draft_advertisement, user_id: user.id }
  let(:valid_advertisement_data) { { advertisement: FactoryBot.attributes_for(:advertisement) } }
  let(:invalid_advertisement_data) { { advertisement: { title: nil } } }

  context 'when not logged in' do
    it_behaves_like 'allows GET index'
    it_behaves_like 'allows GET show'

    it_behaves_like 'denies GET new'
    it_behaves_like 'denies POST create'
    it_behaves_like 'denies GET edit'
    it_behaves_like 'denies PATCH update'
    it_behaves_like 'denies DELETE destroy'
  end

  context 'when logged in as an user' do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end

    it_behaves_like 'allows GET index'
    it_behaves_like 'allows GET show'
    it_behaves_like 'allows GET new'
    it_behaves_like 'allows POST create'
    it_behaves_like 'allows GET edit'
    it_behaves_like 'allows PATCH update'
    it_behaves_like 'allows DELETE destroy'
  end

  context 'when logged in as an adminstrator' do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in administrator
    end

    it_behaves_like 'allows GET index'
    it_behaves_like 'allows GET show'

    it_behaves_like 'denies GET new'
    it_behaves_like 'denies POST create'
    it_behaves_like 'denies GET edit'
    it_behaves_like 'denies PATCH update'

    it_behaves_like 'allows DELETE destroy'
  end
end

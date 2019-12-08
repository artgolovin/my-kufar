require 'rails_helper'

require_relative './shared_examples/adver_types/allowed'
require_relative './shared_examples/adver_types/denied'

RSpec.describe AdverTypesController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let(:administrator) { FactoryBot.create :administrator }

  let(:valid_adver_type_data) { { adver_type: FactoryBot.attributes_for(:adver_type) } }
  let(:invalid_adver_type_data) { { adver_type: { title: nil } } }
  let!(:adver_type) { FactoryBot.create :adver_type }

  let!(:denied_to_destroy_adver_type) do
    adver_type = FactoryBot.create :adver_type

    advers = [ FactoryBot.create(:advertisement, adver_type_id: adver_type.id) ]
    advers << HIDDEN_STATUSES.each_with_object([]) do |hidden_status, hidden_advers|
                hidden_advers << FactoryBot.create(:advertisement,
                                                   status: hidden_status,
                                                   adver_type_id: adver_type.id)
                end

    adver_type
  end

  let(:adver_types) { [ adver_type, denied_to_destroy_adver_type ] }

  context 'when not signed in' do
    it_behaves_like 'denies access to controller'
  end

  context 'when signed in as user' do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in user
    end
  
    it_behaves_like 'denies access to controller'
  end

  context 'when signed in as administrator' do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in administrator
    end

    it_behaves_like 'allows showing AdverTypes'
    it_behaves_like 'allows rendering new form for AdverType'
    it_behaves_like 'allows creating AdverType'
    it_behaves_like 'allows editing AdverType'
    it_behaves_like 'allows updating AdverType'

    it_behaves_like 'allows destroying when there are no advertisements of this type'
    it_behaves_like 'denies destroying AdverType when there are advertisements of that'

  end
end

require 'rails_helper'

RSpec.describe AdsController, type: :controller do

  shared_examples 'anyone can look through advertisements' do
    let(:published_adver) { FactoryBot.create(:advertisement) }
    let(:hidden_adver) { FactoryBot.create(:hidden_advertisement) }

    shared_examples 'basic action functionality' do
      it { is_expected.to respond_with :ok }

      it 'responds with html' do
        expect(response.content_type).to eq "text/html"
      end

      it { is_expected.to render_with_layout('application') }
    end

    describe 'GET index' do
      before { get :index }

      it_behaves_like 'basic action functionality'

      it 'assigns published advertisements' do
        expect(assigns(:ads)).to eq([published_adver])
      end

      it { is_expected.to render_template('index') }
    end

    describe 'GET show' do
      before { get :show, params: {id: published_adver.id} }

      it_behaves_like 'basic action functionality'

      it 'assigns adver' do
        expect(assigns(:adver)).to eq(published_adver)
      end

      it { is_expected.to render_template('show') }
    end
  end

  context 'when not logged in' do
    it_behaves_like 'anyone can look through advertisements'
  end

  context 'when logged in as an user' do
    it_behaves_like 'anyone can look through advertisements'
  end

  context 'when logged in as an adminstrator' do
    it_behaves_like 'anyone can look through advertisements'
  end
end

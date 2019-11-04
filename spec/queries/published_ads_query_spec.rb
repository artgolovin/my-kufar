require 'rails_helper'

RSpec.describe PublishedAdsQuery do
  describe 'find' do
    before do
      FactoryBot.create_list(:advertisement, 5)
      FactoryBot.create_list(:hidden_advertisement, 10)
    end

    subject(:published_ads) { PublishedAdsQuery.find }

    it 'retrieves only published advertisements' do
      expect(published_ads.count).to eq(5)
    end
  end
end

HIDDEN_STATUSES = %i[draft rejected new archived approved].freeze

FactoryBot.define do
  factory :advertisement do
    title { 'Opel Omega' }
    description { 'ads_descr' }
    sequence(:image) { |n| "Image #{n}" }
    status { :published }
    user_id { FactoryBot.create(:user).id }

      factory :hidden_advertisement do
        sequence(:status) { HIDDEN_STATUSES.sample }
      end
  end
end

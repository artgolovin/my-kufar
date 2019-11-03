STATUSES = %i[draft rejected new archived approved].freeze

FactoryBot.define do
  factory :advertisement do
    title { 'Opel Omega' }
    description { 'ads_descr' }
    sequence(:image) { |n| "Image #{n}" }
    type_of_adver { 'first_type' }
    status { 'published' }

      factory :hidden_advertisement do
        sequence(:status) { STATUSES.sample }
      end
  end
end

HIDDEN_STATUSES = %i[draft rejected new archived approved].freeze

FactoryBot.define do
  factory :advertisement do
    title { 'Opel Omega' }
    description { 'ads_descr' }
    # image { "#{Rails.root}/spec/fixtures/capybara.jpg" }
    after(:build) do |advertisement|
      advertisement.image.attach(io: File.open(Rails.root.join("spec", "fixtures", "capybara.jpg")), filename: 'capybara.jpg', content_type: "image/jpg")
    end
    status { :published }
    user_id { FactoryBot.create(:user).id }
    adver_type_id { FactoryBot.create(:adver_type).id }

      factory :hidden_advertisement do
        sequence(:status) { HIDDEN_STATUSES.sample }
      end

      factory :draft_advertisement do
        status { :draft }
      end

      factory :new_advertisement do
        status { :new }
      end

      factory :rejected_advertisement do
        status { :rejected }
      end

      factory :approved_advertisement do
        status { :approved }
      end

      factory :archived_advertisement do
        status { :archived }
      end
  end
end

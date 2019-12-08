FactoryBot.define do
  factory :adver_type do
    sequence(:name) { |n| "#{n} type" }
  end
end

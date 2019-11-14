FactoryBot.define do
  factory :role do

    factory :users_role do
      name { :user }
    end
    factory :administrators_role do
      name { :administrator }
    end
  end
end
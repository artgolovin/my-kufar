FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@mail.com" }
    password { Devise.friendly_token.first(8) }
    sequence(:nickname) { |n| "user#{n}" }
    sequence(:first_name) { |n| "First Name #{n}" }
    sequence(:last_name) { |n| "Last Name #{n}" }
    role_id { Role.find_or_create_by(name: 'user').id }

    factory :administrator do
      sequence(:email) { |n| "admin#{n}@mail.com"}
      password { Devise.friendly_token.first(8) }
      sequence(:nickname) { |n| "admin#{n}" }
      sequence(:first_name) {|n| "First Name #{n}"}
      sequence(:last_name) {|n| "Last Name #{n}"}
      role_id { Role.find_or_create_by(name: 'administrator').id }
    end
  end
end

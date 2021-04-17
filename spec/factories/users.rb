FactoryBot.define do
  factory :user do
    
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    gender_id {2}
    prefecture_id {2}
  end
end

FactoryBot.define do
  factory :clothe do
    
    description { Faker::Lorem.sentence}
    category_id {2}
    association :user

    after(:build) do |pic|
      pic.image.attach(io: File.open('spec/models/test.jpg'), filename: 'test.jpg')
    end
  end
end

FactoryBot.define do
  factory :post do
    
    detail { Faker::Lorem.sentence}
    season_id {2}
    association :user

    after(:build) do |pic|
      pic.image.attach(io: File.open('spec/models/test.jpg'), filename: 'test.jpg')
    end
  end
end

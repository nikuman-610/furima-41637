FactoryBot.define do
  factory :item do
    item_name { Faker::Name.initials(number: 7) }
    summary { Faker::Lorem.paragraph(sentence_count: 4)[0...1000] }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 1, to: 10) }
    condition_id { Faker::Number.between(from: 1, to: 6) }
    charge_id { Faker::Number.between(from: 1, to: 2) }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    date_id { Faker::Number.between(from: 1, to: 3) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test.png'), filename: 'test.png', content_type: 'image/png')
    end
  end
end

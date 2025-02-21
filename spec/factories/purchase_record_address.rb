FactoryBot.define do
  factory :purchase_record_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { '高浜市' }
    house_number { '1-1' }  # より確実な値に変更
    building_name { '東京ビル' }  # より確実な値に変更
    phone_number { '09012345678' }
  end
end
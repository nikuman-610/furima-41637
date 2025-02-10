FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 5) }
    email { Faker::Internet.email }
    password { 'test000' }
    password_confirmation { password }
    first_name { '太郎' }
    last_name { '山田' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    birthday { '1999-09-29' }
  end
end

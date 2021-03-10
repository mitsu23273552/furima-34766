FactoryBot.define do
  factory :item do
    association :user
    title { Faker::Lorem.word }
    item_comment { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    item_quality_id { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id { Faker::Number.between(from: 2, to: 4) }
  end
end

FactoryBot.define do
  factory :rop_to_address do
    association :item
    association :user
    token { 'tok_abcdefghijk00000000000000000' }
    to_postal_code { '111-1111' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    to_city { Gimei.city.kanji }
    to_address1 { '東京ハイツ' }
    to_address2 { '2-4-6' }
    to_telephone_number { '09012345678' }
  end
end

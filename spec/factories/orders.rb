FactoryBot.define do
  factory :order do
    product_name { Faker::Commerce.product_name }
    product_count { Faker::Number.between(from: 1, to: 100) }
    association :customer
  end
end

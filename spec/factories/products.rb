FactoryBot.define do
  factory :product do
    name                    { '商品' }
    content                 { '説明' }
    category_id             { '2' }
    shipping_charge_id      { '2' }
    shipping_region_id      { '2' }
    shipping_date_id        { '2' }
    condition_id            { '2' }
    price                   { '500' }
    association :user
  end
end

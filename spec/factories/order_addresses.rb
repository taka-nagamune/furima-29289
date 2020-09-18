FactoryBot.define do
  factory :order_address do
    postal_code {'123-1234'}
    address {'1-1'}
    city {'東'}
    shipping_region_id {2}
    call_number {"00000000000"}
    token {"aaaaaaaaaaaa"}
  end
end

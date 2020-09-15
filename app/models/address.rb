class Address < ApplicationRecord
  belongs_to  :order

  with_options presence: true do
    validates :postal_code
    validates :shipping_region
    validates :city
    validates :address
    validates :building_name
    validates :call_number
  end
end

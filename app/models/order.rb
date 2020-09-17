class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_one :address
  # belongs_to_active_hash :shipping_region
end

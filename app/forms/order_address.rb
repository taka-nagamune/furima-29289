class OrderAddress

  include ActiveModel::Model
  attr_accessour :postal_code, :shipping_region, :city, :address, :building_name, :call_number, :order_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :shipping_region
    validates :city
    validates :address
    validates :building_name
    validates :call_number, numericality: {less_than_or_equal_to:11}
  end
end
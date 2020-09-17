class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_region_id, :city, :address, :building_name, :call_number,:product_id, :user_id

  # with_options presence: true do
  #   validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  #   validates :shipping_region, numericality: {other_than: 0}
  #   validates :city
  #   validates :address
  #   validates :building_name
  #   validates :call_number, numericality: {less_than_or_equal_to:11}
  # end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, building_name: building_name, call_number: call_number, address: address, order_id: order.id)
  end
end
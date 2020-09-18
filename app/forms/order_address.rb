class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_region_id, :city, :address, :building_name, :call_number,:product_id, :user_id

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  HARF_SIZE_NUMBER = /\A[0-9]+\z/

  with_options presence: true do
    validates :postal_code,format: {with: POSTAL_CODE_REGEX}
    validates :city
    validates :address
    validates :call_number, format: {with: HARF_SIZE_NUMBER}, length: {maximum: 11} 
    validates :token
    validates :shipping_region_id, numericality: {other_than: 1}
  end




  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, shipping_region_id: shipping_region_id, city: city, building_name: building_name, call_number: call_number, address: address, order_id: order.id)
  end
  
end
class OrdersController < ApplicationController
  before_action :set_product
  before_action :move_to_sign_in
  before_action :move_to_top
  def index
    @order = Order.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  
  def order_params
    params.permit(:token, :product_id,:postal_code,:city,:address,:building_name,:shipping_region_id,:call_number).merge(user_id: current_user.id)
  end
    
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    redirect_to root_path if current_user.id == @product.user_id
  end
end

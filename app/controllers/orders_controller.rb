class OrdersController < ApplicationController
  before_action :set_product
  before_action :move_to_sign_in
  before_action :move_to_top
  def index
  end

  def create
    # binding.pry
    @order = OrderAddress.new(order_params)
    # binding.pry
    if @order.valid?
      # pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
# params {info{ post address} token}
# params.require(:info).permit(:post, :address).merge(token:params[:token])
  private
  
  def order_params
    params.permit(:token, :product_id,:postal_code,:city,:address,:building_name,:shipping_region_id,:call_number).merge(user_id: current_user.id)
  end
    
  def pay_item
    Payjp.api_key = "sk_test_5521afb3ce4ad990c6d008e9"
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency:'jpy'
    )
    # binding.pry
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

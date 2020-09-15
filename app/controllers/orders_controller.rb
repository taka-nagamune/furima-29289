class OrdersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def new
  end

  def create
  end

  private
  
  def order_params
    params.permit(:)
    
end

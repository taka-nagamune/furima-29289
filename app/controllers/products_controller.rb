class ProductsController < ApplicationController
  before_action :move_to_sign_in, except: [:index]
  def index
    # @products = Product.all
  end


  def new
    @product = Product.new
  end
  

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  

  private
  def product_params
    params.require(:product).permit(:name, :content, :price, :image, :shipping_charge_id, :shipping_region_id, :shipping_date_id, :category_id, :condition_id).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

end

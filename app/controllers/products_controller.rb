class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @products = Product.all
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def new
    @product = Product.new
  end

  def create
    # Product.create(product_params)
  end
  

  private
  def product_params
    params.require(:product).permit(:name, :content, :price)
  end
end

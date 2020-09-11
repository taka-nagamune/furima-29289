class ProductsController < ApplicationController
  before_action :move_to_sign_in, except: [:index, :show]
  before_action :find_params_id, only: [:show,:edit,:update,:destroy]
  def index
    @products = Product.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render:destroy
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :price, :image, :shipping_charge_id, :shipping_region_id, :shipping_date_id, :category_id, :condition_id).merge(user_id: current_user.id)
  end

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def find_params_id
    @product = Product.find(params[:id])
  end
end

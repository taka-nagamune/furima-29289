require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('public/images/test.jpg')
  end

  describe '商品出品機能'
    context '出品が上手くいくとき' do
      it 'name, content,image,category_id,condition_id,shipping_charge_id,shipping_region_id,shipping_date_id,user_id,priceがあれば出品できる'do
      expect(@product).to be_valid
      end
      it "nameが入力されていれば出品できる"do
        @product.name = "商品"
        expect(@product).to be_valid
      end
      it "contentが入力されていれば出品できる" do
        @product.content = "説明"
        expect(@product).to be_valid
      end
      it "imageが保存されていれば出品できる" do
        expect(@product.image).to be_valid
      end
      it "category_idを入力されていれば出品できる" do
        @product.category_id = "2"
        expect(@product).to be_valid
      end
      it "shipping_charge_idを入力していれば出品できる" do
        @product.shipping_charge_id = "2"
        expect(@product).to be_valid
      end
      it "shipping_region_idを入力していれば出品できる" do
        @product.shipping_region_id = "2"
        expect(@product).to be_valid
      end
      it "shipping_date_idを入力していれば出品できる" do
        @product.shipping_date_id = "2"
        expect(@product).to be_valid
      end
      it "condition_idが入力されていれば出品できる" do
        @product.condition_id = "2"
        expect(@product).to be_valid
      end
      it "priceが入力されていれば出品できる" do
        @product.price = "555"
        expect(@product).to be_valid
      end
      it "priceが半角数字で、かつ¥300~¥9,999,999の間なら出品できる" do
        @product.price = "1111"
        expect(@product).to be_valid
      end
    end

    context "出品が上手くいかないとき" do
      it "nameが空だと出品できない" do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it "imageが空だと出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "contentが空だと出品できない" do
        @product.content = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Content can't be blank")
      end
      it "category_idが空だと出品できない"do
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空だと出品できない" do
        @product.condition_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_charge_idが空だと出品できない" do
        @product.shipping_charge_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge is not a number")
      end
      it "shipping_date_idが空だと出品できない" do
        @product.shipping_date_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date is not a number")
      end
      it "shipping_region_idが空だと出品できない" do
        @product.shipping_region_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping region is not a number")
      end
      it "priceが空だと出品できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角数字だと出品できない" do
      @product.price = "１１１１"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it "価格の範囲が¥300より下だと出品できない"do
        @product.price = "299"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格の範囲が¥9999999より高いと出品できない" do
        @product.price = "10000000"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "category_idが1の場合出品できない" do
        @product.category_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idが1の場合出品できない" do
        @product.condition_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 1")
      end
      it "shipping_charge_idが1のとき出品できない" do
        @product.shipping_charge_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      it "shipping_date_idが1のとき出品できない" do
        @product.shipping_date_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date must be other than 1")
      end
      it "shipping_region_idが1のとき出品できない" do
        @product.shipping_region_id = "1"
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping region must be other than 1")
      end
    end
end

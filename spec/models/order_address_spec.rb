require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能'
  context '購入が上手くいくとき' do
    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@order_address).to be_valid
    end
    it 'building_nameが空でも購入できる' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
  end

  context '購入が上手くいかないとき' do
    it 'postal_codeが空だと購入できない'do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeに - を使ってないと購入できない' do
      @order_address.postal_code = "3333333"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end
    it 'cityが空だと購入できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと購入できない' do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'shipping_region_idが空だと購入できない' do
      @order_address.shipping_region_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping region can't be blank")
    end
    it 'shipping_region_idが1だと購入できない' do
      @order_address.shipping_region_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping region must be other than 1")
    end
    it 'call_numberが空だと購入できない' do
      @order_address.call_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Call number can't be blank")
    end
    it 'call_numberが11桁以内でないと購入できない'do
      @order_address.call_number = "111111111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Call number is too long (maximum is 11 characters)")
    end
    it 'call_numberに - を入力すると購入できない' do
      @order_address.call_number = "111-1111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Call number is invalid")
    end
    it 'call_numberは全て半角数値でないと購入できない'do
      @order_address.call_number = "１１１１１１１"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Call number is invalid")
    end
    it 'tokenが空だと購入できない'do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

  end
end

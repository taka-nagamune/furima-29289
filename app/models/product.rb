class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :shipping_date

  belongs_to        :user
  has_one_attached  :image

  validates :name, :content, :condition, :shipping_region, :shipping_region, :shipping_date, :category, :image, presence: true
  
  validates :condition_id, :shipping_date_id, :shipping_charge_id, :shipping_region_id, :category_id, numericality:{ other_than: 1 }
  
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: {with:/\A[0-9]+\z/}
end

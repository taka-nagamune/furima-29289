class RemoveImageFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :image, :text
  end
end

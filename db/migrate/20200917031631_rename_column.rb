class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :prefecture_id, :shipping_region_id
  end
end

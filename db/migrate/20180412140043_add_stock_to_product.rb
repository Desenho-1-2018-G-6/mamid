class AddStockToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :stock, :integer
  end
end

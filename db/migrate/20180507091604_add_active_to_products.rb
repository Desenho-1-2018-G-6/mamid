class AddActiveToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :active, :boolean
  end
end

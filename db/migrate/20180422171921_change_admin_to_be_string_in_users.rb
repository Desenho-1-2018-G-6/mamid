class ChangeAdminToBeStringInUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :admin, :string
  end
end

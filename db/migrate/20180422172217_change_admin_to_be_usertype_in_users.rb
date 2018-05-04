class ChangeAdminToBeUsertypeInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :admin, :user_type
  end
end

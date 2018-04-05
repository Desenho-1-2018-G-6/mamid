class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.date :birth_date
      t.string :gender
      t.integer :phone

      t.timestamps
    end
  end
end

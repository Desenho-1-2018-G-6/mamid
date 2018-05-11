class CreateEmptyStates < ActiveRecord::Migration[5.0]
  def change
    create_table :empty_states do |t|

      t.timestamps
    end
  end
end

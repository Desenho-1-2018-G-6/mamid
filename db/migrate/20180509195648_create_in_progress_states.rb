class CreateInProgressStates < ActiveRecord::Migration[5.0]
  def change
    create_table :in_progress_states do |t|

      t.timestamps
    end
  end
end

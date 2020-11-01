class AddTaskIdToRestaurant < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :room_id
    add_reference :rooms, :task, foreign_key: true
  end
end

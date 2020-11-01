class AddReferencestoTasks < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rooms, :task, foreign_key: true
    add_reference :tasks, :room, foreign_key: true
  end
end

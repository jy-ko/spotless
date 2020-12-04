class AddNotetoTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :notes, :text 
  end
end

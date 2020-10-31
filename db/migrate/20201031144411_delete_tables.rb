class DeleteTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :rooms
    drop_table :tasks
  end
end

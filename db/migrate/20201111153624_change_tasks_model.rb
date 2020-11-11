class ChangeTasksModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :number, :integer
    remove_column :tasks, :frequency, :string
    add_column :tasks, :start_time, :datetime
    add_column :tasks, :recurring, :text
  end
end

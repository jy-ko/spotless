class AddScheduletoTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :cycle, :datetime 
    add_column :tasks, :last_cleaned, :datetime 
  end
end

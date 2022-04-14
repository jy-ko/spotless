class ChangeDatatypeTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :start_time, :date
    change_column :tasks, :last_cleaned, :date
  end
end

class ChangeTaskModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :cycle
    add_column :tasks, :number, :integer
    add_column :tasks, :frequency, :string
  end
end

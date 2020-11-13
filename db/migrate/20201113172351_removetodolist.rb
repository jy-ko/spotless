class Removetodolist < ActiveRecord::Migration[5.2]
  def change
    drop_table :todolists
  end
end

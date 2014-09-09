class AddIconToUser < ActiveRecord::Migration
  def change
    add_column :users, :icon, :binary
  end
end

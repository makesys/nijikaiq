class AddTextToProject < ActiveRecord::Migration
  def change
    add_column :projects, :text, :string
  end
end

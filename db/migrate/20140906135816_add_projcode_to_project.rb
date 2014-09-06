class AddProjcodeToProject < ActiveRecord::Migration
  def change
    add_column :projects, :projcode, :string
  end
end

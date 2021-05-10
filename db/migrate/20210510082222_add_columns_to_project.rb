class AddColumnsToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :pain, :text
    add_column :projects, :solution, :text
    add_column :projects, :target, :text
  end
end

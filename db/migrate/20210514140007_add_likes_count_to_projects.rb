class AddLikesCountToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :likes_count, :integer, default: 0, null: false
  end
end

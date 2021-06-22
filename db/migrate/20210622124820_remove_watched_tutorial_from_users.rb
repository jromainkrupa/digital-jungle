class RemoveWatchedTutorialFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :watched_tutorial, :boolean
  end
end

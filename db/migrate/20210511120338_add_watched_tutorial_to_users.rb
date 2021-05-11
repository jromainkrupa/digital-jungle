class AddWatchedTutorialToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :watched_tutorial, :boolean, default: false
  end
end

class RemoveNextActionFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :next_action, :string
  end
end

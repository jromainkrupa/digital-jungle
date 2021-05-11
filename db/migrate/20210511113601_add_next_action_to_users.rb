class AddNextActionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :next_action, :integer, default: 0
  end
end

class RemoveBalanceFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :balance, :integer
  end
end
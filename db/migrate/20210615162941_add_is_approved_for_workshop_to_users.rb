class AddIsApprovedForWorkshopToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_approved_for_workshop, :boolean, default: false
  end
end

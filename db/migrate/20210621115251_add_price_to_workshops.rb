class AddPriceToWorkshops < ActiveRecord::Migration[6.1]
  def change
    add_column :workshops, :price, :integer
  end
end

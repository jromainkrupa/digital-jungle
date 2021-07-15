class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :price_in_cents

      t.timestamps
    end
  end
end

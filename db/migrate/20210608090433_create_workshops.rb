class CreateWorkshops < ActiveRecord::Migration[6.1]
  def change
    create_table :workshops do |t|
      t.string :name
      t.integer :duration
      t.text :content
      t.integer :price

      t.timestamps
    end
  end
end

class CreateWorkshops < ActiveRecord::Migration[6.1]
  def change
    create_table :workshops do |t|
      t.string :name
      t.datetime :start_date
      t.integer :duration
      t.string :image_url
      t.integer :capacity
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

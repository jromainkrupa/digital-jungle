class CreateWorkshopBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :workshop_bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :workshop, null: false, foreign_key: true

      t.timestamps
    end
  end
end

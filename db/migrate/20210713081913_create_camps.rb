class CreateCamps < ActiveRecord::Migration[6.1]
  def change
    create_table :camps do |t|
      t.string :name
      t.boolean :is_current
      t.datetime :start_date

      t.timestamps
    end
  end
end

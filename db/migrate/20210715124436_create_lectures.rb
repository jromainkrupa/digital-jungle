class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :name
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end

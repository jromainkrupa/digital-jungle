class CreatePitches < ActiveRecord::Migration[6.1]
  def change
    create_table :pitches do |t|
      t.string :title
      t.references :project, null: false, foreign_key: true
      t.boolean :is_publishable, default: false

      t.timestamps
    end
  end
end

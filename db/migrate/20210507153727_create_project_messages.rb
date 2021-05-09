class CreateProjectMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :project_messages do |t|
      t.string :username
      t.text :body
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end

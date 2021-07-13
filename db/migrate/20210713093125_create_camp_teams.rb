class CreateCampTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :camp_teams do |t|
      t.references :camp, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

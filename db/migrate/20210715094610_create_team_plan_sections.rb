class CreateTeamPlanSections < ActiveRecord::Migration[6.1]
  def change
    create_table :team_plan_sections do |t|
      t.references :team, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end

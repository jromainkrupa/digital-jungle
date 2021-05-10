class AddArtOfPitchToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :done_pitch_lesson, :boolean, default: false
  end
end

class RemoveDonePitchLessonFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :done_pitch_lesson, :boolean
  end
end

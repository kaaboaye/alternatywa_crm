class CreateLessonSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_subjects do |t|
      t.string :name

      t.timestamps
    end
  end
end

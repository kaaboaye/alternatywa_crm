class CreateLessonSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_subjects do |t|
      t.boolean :active, :default => true
      t.string :name

      t.timestamps
    end
  end
end

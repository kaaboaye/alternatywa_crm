class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.boolean :active, :default => true
      t.integer :giving_member_id
      t.integer :taking_member_id
      t.integer :lesson_subject_id
      t.time :time
      t.datetime :date_time

      t.timestamps
    end
  end
end

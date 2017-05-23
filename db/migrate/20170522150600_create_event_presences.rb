class CreateEventPresences < ActiveRecord::Migration[5.1]
  def change
    create_table :event_presences do |t|
      t.integer :event_id
      t.integer :member_id
      t.time :time

      t.timestamps
    end
  end
end

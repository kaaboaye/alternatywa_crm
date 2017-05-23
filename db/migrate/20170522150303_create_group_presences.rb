class CreateGroupPresences < ActiveRecord::Migration[5.1]
  def change
    create_table :group_presences do |t|
      t.integer :member_id
      t.integer :group_id
      t.time :time

      t.timestamps
    end
  end
end

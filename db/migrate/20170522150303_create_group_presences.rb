class CreateGroupPresences < ActiveRecord::Migration[5.1]
  def change
    create_table :group_presences do |t|
      t.boolean :active, :default => true
      t.integer :member_id
      t.integer :group_id
      t.date :datetime

      t.timestamps
    end
  end
end

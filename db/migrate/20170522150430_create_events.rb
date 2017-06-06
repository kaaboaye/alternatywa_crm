class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.boolean :active, :default => true
      t.string :name
      t.text :description
      t.datetime :datetime
      t.integer :event_category_id

      t.timestamps
    end
  end
end

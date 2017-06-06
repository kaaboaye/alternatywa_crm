class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.boolean :active, :default => true
      t.string :name
      t.text :description
      t.time :time

      t.timestamps
    end
  end
end

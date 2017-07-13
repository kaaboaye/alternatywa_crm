class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.boolean :active, :default => true
      t.integer :member_id
      t.text :note

      t.timestamps
    end
  end
end

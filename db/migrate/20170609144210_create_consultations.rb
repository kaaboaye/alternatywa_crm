class CreateConsultations < ActiveRecord::Migration[5.1]
  def change
    create_table :consultations do |t|
      t.boolean :active, :default => true
      t.integer :member_id
      t.text :description
      t.datetime :datetime

      t.timestamps
    end
  end
end

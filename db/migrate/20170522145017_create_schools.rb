class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.boolean :active, :default => true
      t.string :name

      t.timestamps
    end
  end
end

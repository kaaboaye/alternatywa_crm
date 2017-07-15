class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.integer :member_id
      t.date :since
      t.date :finish
      t.string :number
      t.text :description

      t.timestamps
    end
  end
end

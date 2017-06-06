class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.boolean :active, :default => true
      t.string :first_name
      t.string :last_name
      t.integer :pesel, :limit => 5
      t.string :street
      t.string :house_number
      t.string :city
      t.integer :school_id
      t.string :work
      t.string :email
      t.integer :phone, :limit => 6
      t.integer :fathers_phone, :limit => 6
      t.integer :mothers_phone, :limit => 6

      t.timestamps
    end
  end
end

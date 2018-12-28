class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.text :station
      t.integer :deposit
      t.integer :key
      t.text :floor
      t.integer :money
      t.text :comment
      t.text :adress
      t.text :image
    end
  end
end

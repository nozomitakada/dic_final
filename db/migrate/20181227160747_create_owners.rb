class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :email
      t.integer :phone_number
      t.text :adress
      t.string :password_digest

      t.timestamps
    end
  end
end

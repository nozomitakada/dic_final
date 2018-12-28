class AddOwnerRefToHouses < ActiveRecord::Migration[5.1]
  def change
    add_reference :houses, :owner, foreign_key: true
  end
end

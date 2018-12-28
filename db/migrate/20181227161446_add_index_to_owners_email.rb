class AddIndexToOwnersEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :owners, :email, unique: true
  end
end

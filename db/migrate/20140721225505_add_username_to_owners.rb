class AddUsernameToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :username, :string
    add_index :owners, :username, unique: true
  end
end

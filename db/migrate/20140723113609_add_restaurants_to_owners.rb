class AddRestaurantsToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :restaurant, :string
  end
end

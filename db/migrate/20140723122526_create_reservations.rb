class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.datetime :date
      t.text :message
      t.string :restaurant

      t.timestamps
    end
  end
end

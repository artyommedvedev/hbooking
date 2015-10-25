class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :number
      t.time :begining
      t.time :ending
      t.float :cost

      t.timestamps null: false
    end
  end
end

class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :Room, :RoomType
    add_foreign_key :Booking, :Room
    add_foreign_key :Booking, :Person
  end
end

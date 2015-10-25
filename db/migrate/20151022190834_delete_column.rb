class DeleteColumn < ActiveRecord::Migration
  def change
    remove_column "bookings", "person_uid"
  end
end

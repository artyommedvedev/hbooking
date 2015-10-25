class AddColumnPersonUidToBooking < ActiveRecord::Migration
  def change
    add_column(:bookings,'person_uid','integer')
  end
end

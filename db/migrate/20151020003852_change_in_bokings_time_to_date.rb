class ChangeInBokingsTimeToDate < ActiveRecord::Migration
  def up
    change_column(:bookings, :begining, :date)
    change_column(:bookings, :ending, :date)
  end
  def down
    change_column(:bookings, :begining, :time)
    change_column(:bookings, :ending, :time)

  end
end

class ChangeRoomTypeToString < ActiveRecord::Migration
  def up
    change_column(:room_types, :type_name, :string)
  end
  def down
    change_column(:room_types, :type_name, :integer)

  end
end

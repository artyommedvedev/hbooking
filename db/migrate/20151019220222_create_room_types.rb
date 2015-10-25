class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.integer :type_name

      t.timestamps null: false
    end
  end
end

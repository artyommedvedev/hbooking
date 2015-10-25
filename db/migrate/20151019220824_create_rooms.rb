class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number
      t.integer :type_id
      t.float :price
      t.boolean :status

      t.timestamps null: false
    end
  end
end

class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :person_uid
      t.integer :room_number
      t.date :begining
      t.date :ending
      t.float :cost

      t.timestamps null: false
    end
  end
end

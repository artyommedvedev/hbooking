class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :surename
      t.string :password

      t.timestamps null: false
    end
  end
end

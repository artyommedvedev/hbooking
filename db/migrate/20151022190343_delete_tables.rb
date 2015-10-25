class DeleteTables < ActiveRecord::Migration
  def change
    drop_table "People"
    drop_table "Deals"

  end
end

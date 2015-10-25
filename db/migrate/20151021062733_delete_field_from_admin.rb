class DeleteFieldFromAdmin < ActiveRecord::Migration
  def up
    remove_column "admins", "username"
  end
  def down
    add_column "admins", "username", :string
  end
end

class RenameColumnInAdmin < ActiveRecord::Migration
  def up
    rename_column(:admins,'surename','username')

  end
  def down
    rename_column(:admins, 'username', 'surename')

  end
end

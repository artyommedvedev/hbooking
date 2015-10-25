class AddPasswordDigestToAdmin < ActiveRecord::Migration
  def up
    add_column "admins", "password_digest", :string
  end
  def down
    remove_column "admins", "password_digest"
  end
end

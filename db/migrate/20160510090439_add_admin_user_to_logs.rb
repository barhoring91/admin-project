class AddAdminUserToLogs < ActiveRecord::Migration
  def change
    add_reference :logs, :admin_user, index: true, foreign_key: true, null: false
  end
end

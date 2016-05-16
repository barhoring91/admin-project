class AddEmailToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :email, :string, null: false
    add_index :admin_users, :email, unique: true
  end
end

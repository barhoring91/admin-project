class AddAdminUserToTokens < ActiveRecord::Migration
  def change
    add_reference :tokens, :admin_user, index: true, foreign_key: true, null: false
  end
end

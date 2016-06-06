class Token < ActiveRecord::Base
  validates :token, :admin_user_id, :presence => true, null: false
end

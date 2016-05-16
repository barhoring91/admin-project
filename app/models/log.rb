class Log < ActiveRecord::Base
  validates :app_key, :admin_user_id, :activity_type_id, :presence => true
end

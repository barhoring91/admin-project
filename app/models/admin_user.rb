class AdminUser < ActiveRecord::Base
  validates :name, :password, presence: true
end

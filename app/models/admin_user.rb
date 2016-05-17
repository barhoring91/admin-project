class AdminUser < ActiveRecord::Base
  validates :name, :password, presence: true
  validates :email, uniqueness: true, presence: true
end

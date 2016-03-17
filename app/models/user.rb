class User < ActiveRecord::Base
  include Clearance::User

  validates :name, presence:true, uniqueness:true 
  has_secure_password
end

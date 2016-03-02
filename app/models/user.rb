class User < ActiveRecord::Base
<<<<<<< HEAD
  validates :name, presence:true, uniqueness:true 
  has_secure_password
=======
	#before_create :confirmation_token

	#validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	has_secure_password
	
	
	def get_email
		return :email
	end
	
	def get_password
		return :password
	end
	
	#def email_activate
		#self.email_confirmed = true
		#self.confirm_token = nil
		#save!(:validate => false)
	#end
	
	#private
	#def confirmation_token
		#if self.confirm_token.blank?
			#self.confirm_token = SecureRandom.urlsafe_base64.to_s
		#end
	#end
>>>>>>> origin/master
end

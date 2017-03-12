class Feed < ActiveRecord::Base
	before_save :generate_unique_token

	def generate_unique_token(length=50)
	    loop do
      		secret = self.secret = SecureRandom.urlsafe_base64(length, false)
      		break secret unless self.class.exists?(secret: secret)
    	end
	end

end

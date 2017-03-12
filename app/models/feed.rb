class Feed < ActiveRecord::Base
	before_save :generate_unique_token
	after_save :send_to_superfeedr
	has_many :entries, dependent: :destroy
	validates :url, uniqueness: true
	

	def generate_unique_token(length=50)
	    loop do
      		secret = self.secret = SecureRandom.urlsafe_base64(length, false)
      		break secret unless self.class.exists?(secret: secret)
    	end
	end

	def notified params
	    update_attributes(:status => params["status"]["http"])

	  	params['items'].each do |i|
	  		entries.create(:title => i["title"], :url => i["permalinkUrl"], :content => i["content"])
	  	end
  	end

  	private
	  	def send_to_superfeedr 
	  		SuperfeedrEngine::Engine.subscribe(self, {:retrieve => true})
	  	end

end

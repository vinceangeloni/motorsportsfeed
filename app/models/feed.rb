class Feed < ActiveRecord::Base
	before_save :generate_unique_token
	after_save :add_entries
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

  	
  	def add_entries
  		feed = Feed.find(self.id)
  		parsed_feed = Feedjira::Feed.fetch_and_parse(self.url)
  		feed_entries = parsed_feed.entries
  		feed_entries.each do |entry|
  			if entry.image
  				image = entry.image
  			end
  			Entry.create(feed_id: self.id, url: entry.url, title: entry.title, content: entry.summary, created_at: entry.published, image: image)
  		end
  	end

    def self.refresh_feeds
      feeds = Feed.all
      feeds.each do |feed|
        parsed_feed = Feedjira::Feed.fetch_and_parse(feed.url)
        feed_entries = parsed_feed.entries
        feed_entries.each do |entry|
          if entry.image
            image = entry.image
          end
          Entry.create(feed_id: feed.id, url: entry.url, title: entry.title, content: entry.summary, created_at: entry.published, image: image)
        end
      end
    end

end

class Entry < ActiveRecord::Base
  belongs_to :feed
  paginates_per 50
  validates :url, uniqueness: true

	default_scope {
		order('created_at DESC')
	}
end

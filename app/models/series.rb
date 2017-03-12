class Series < ActiveRecord::Base
  belongs_to :feeds
  belongs_to :calendar
end

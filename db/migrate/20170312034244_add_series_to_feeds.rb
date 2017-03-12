class AddSeriesToFeeds < ActiveRecord::Migration
  def change
    add_reference :feeds, :series, index: true, foreign_key: true
  end
end

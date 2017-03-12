class RemoveFeedFromSeries < ActiveRecord::Migration
  def change
    remove_reference :series, :feed, index: true, foreign_key: true
  end
end

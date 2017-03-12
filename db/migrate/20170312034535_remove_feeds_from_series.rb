class RemoveFeedsFromSeries < ActiveRecord::Migration
  def change
    remove_reference :series, :feeds, index: true, foreign_key: true
  end
end

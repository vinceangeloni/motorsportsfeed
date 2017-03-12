class AddSecretToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :secret, :string
  end
end

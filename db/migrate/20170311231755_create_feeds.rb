class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :description
      t.string :url
      t.boolean :active

      t.timestamps null: false
    end
  end
end

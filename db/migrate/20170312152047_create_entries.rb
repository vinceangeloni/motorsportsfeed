class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :feed, index: true, foreign_key: true
      t.string :title
      t.string :url
      t.text :content
      t.string :image

      t.timestamps null: false
    end
  end
end

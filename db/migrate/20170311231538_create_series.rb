class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name
      t.text :description
      t.string :logo
      t.references :feeds, index: true, foreign_key: true
      t.references :calendar, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.integer :year
      t.references :series, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

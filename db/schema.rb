# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170312152449) do

  create_table "calendars", force: :cascade do |t|
    t.integer  "year"
    t.integer  "series_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "calendars", ["series_id"], name: "index_calendars_on_series_id"

  create_table "entries", force: :cascade do |t|
    t.integer  "feed_id"
    t.string   "title"
    t.string   "url"
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "entries", ["feed_id"], name: "index_entries_on_feed_id"

  create_table "feeds", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "series_id"
    t.string   "secret"
  end

  add_index "feeds", ["series_id"], name: "index_feeds_on_series_id"

  create_table "series", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.integer  "calendar_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "series", ["calendar_id"], name: "index_series_on_calendar_id"

end

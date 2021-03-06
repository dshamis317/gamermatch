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

ActiveRecord::Schema.define(version: 20140519204138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_ownerships", force: true do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "games", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "release_date"
    t.string   "image_url"
    t.string   "publisher"
    t.string   "genre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "developer"
    t.integer  "gb_id"
  end

  create_table "platform_appearances", force: true do |t|
    t.integer  "game_id"
    t.integer  "platform_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "platform_appearances", ["game_id"], name: "index_platform_appearances_on_game_id", using: :btree
  add_index "platform_appearances", ["platform_id"], name: "index_platform_appearances_on_platform_id", using: :btree

  create_table "platforms", force: true do |t|
    t.integer  "user_id"
    t.string   "platform_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age"
    t.string   "location"
    t.string   "phone_number"
    t.string   "password_digest"
  end

end

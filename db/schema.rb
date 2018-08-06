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

ActiveRecord::Schema.define(version: 20180805151914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.integer  "district_id"
    t.integer  "political_party_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "candidates", ["district_id"], name: "index_candidates_on_district_id", using: :btree
  add_index "candidates", ["political_party_id"], name: "index_candidates_on_political_party_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "hive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "districts", ["hive_id"], name: "index_districts_on_hive_id", using: :btree

  create_table "engagements", force: :cascade do |t|
    t.string   "notes"
    t.integer  "candidate_id"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",       null: false
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.string   "image"
    t.text     "body"
    t.string   "fb_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hive_contacts", force: :cascade do |t|
    t.integer "hive_id"
    t.string  "full_name"
    t.string  "phone"
    t.string  "email"
    t.string  "function"
    t.string  "fb_page"
  end

  add_index "hive_contacts", ["hive_id"], name: "index_hive_contacts_on_hive_id", using: :btree

  create_table "hive_meetings", force: :cascade do |t|
    t.integer "hive_id"
    t.string  "location"
    t.string  "map_url"
    t.string  "city"
    t.string  "address"
    t.date    "meeting_date"
    t.time    "meeting_time"
    t.string  "agenda"
    t.string  "report"
  end

  add_index "hive_meetings", ["hive_id"], name: "index_hive_meetings_on_hive_id", using: :btree

  create_table "hives", force: :cascade do |t|
    t.string  "name"
    t.string  "image"
    t.integer "number"
    t.string  "fb_url"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "postal_code"
    t.string   "city"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "confirmed_at"
  end

  create_table "participants", force: :cascade do |t|
    t.string   "first_name",              null: false
    t.string   "last_name",               null: false
    t.string   "email",                   null: false
    t.string   "phone"
    t.integer  "event_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "postal_code", limit: 10
    t.string   "city",        limit: 200
  end

  add_index "participants", ["event_id"], name: "index_participants_on_event_id", using: :btree

  create_table "political_parties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

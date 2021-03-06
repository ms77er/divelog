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

ActiveRecord::Schema.define(version: 20170729001718) do

  create_table "divings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "DiveNo"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "location"
    t.date     "DiveDate"
    t.time     "DiveIn"
    t.time     "DiveOut"
    t.integer  "MaxDepth",     limit: 2
    t.integer  "AvgDepth",     limit: 2
    t.integer  "WaterTemp",    limit: 2
    t.integer  "Transparancy", limit: 2
    t.string   "Memo"
    t.index ["user_id"], name: "index_divings_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "LicenceNo"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "divings", "users"
end

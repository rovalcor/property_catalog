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

ActiveRecord::Schema.define(version: 20160922070425) do

  create_table "features", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features_properties", id: false, force: true do |t|
    t.integer "feature_id",  null: false
    t.integer "property_id", null: false
  end

  create_table "photos", force: true do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "property_id"
    t.integer  "rank_order"
  end

  create_table "properties", force: true do |t|
    t.string   "title"
    t.string   "property_type"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

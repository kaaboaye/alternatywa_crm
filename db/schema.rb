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

ActiveRecord::Schema.define(version: 20170522151713) do

  create_table "event_categories", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_presences", force: :cascade do |t|
    t.boolean "active", default: true
    t.integer "event_id"
    t.integer "member_id"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "name"
    t.text "description"
    t.integer "event_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_presences", force: :cascade do |t|
    t.boolean "active", default: true
    t.integer "member_id"
    t.integer "group_id"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_subjects", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.boolean "active", default: true
    t.integer "giving_member_id"
    t.integer "taking_member_id"
    t.integer "lesson_subject_id"
    t.time "time"
    t.datetime "date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "first_name"
    t.string "last_name"
    t.integer "pesel"
    t.string "street"
    t.string "house_number"
    t.string "city"
    t.integer "school_id"
    t.string "work"
    t.integer "phone"
    t.integer "fathers_phone"
    t.integer "mothers_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

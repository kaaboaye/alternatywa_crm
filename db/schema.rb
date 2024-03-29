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

ActiveRecord::Schema.define(version: 20170715105456) do

  create_table "consultations", force: :cascade do |t|
    t.boolean "active", default: true
    t.integer "member_id"
    t.text "description"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "member_id"
    t.date "since"
    t.date "finish"
    t.string "number"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "datetime"
    t.integer "event_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_presences", force: :cascade do |t|
    t.boolean "active", default: true
    t.integer "member_id"
    t.integer "group_id"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "name"
    t.text "description"
    t.time "time"
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
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "first_name"
    t.string "last_name"
    t.string "id_card"
    t.integer "pesel", limit: 5
    t.date "birth_date"
    t.string "street"
    t.string "house_number"
    t.string "city"
    t.integer "school_id"
    t.string "work"
    t.string "email"
    t.integer "phone", limit: 6
    t.integer "fathers_phone", limit: 6
    t.integer "mothers_phone", limit: 6
    t.boolean "is_parents_agreement"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.boolean "active", default: true
    t.integer "member_id"
    t.text "note"
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

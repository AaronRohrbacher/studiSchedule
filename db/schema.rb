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

ActiveRecord::Schema.define(version: 20171220194033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_events", force: :cascade do |t|
    t.integer "school_id"
    t.integer "account_id"
    t.integer "event_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "school_id"
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "parent_name"
    t.string "parent2_name"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "phone2"
    t.string "email2"
    t.string "student_email"
    t.string "student_phone"
    t.boolean "admin", default: false
    t.boolean "is_teacher", default: false
    t.boolean "registration_complete"
    t.boolean "active", default: true
  end

  create_table "attendances", force: :cascade do |t|
    t.integer "school_id"
    t.integer "account_id"
    t.string "event_name"
    t.string "attendance_type"
  end

  create_table "boards", force: :cascade do |t|
    t.integer "event_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.string "event_type"
    t.string "description"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "board_id"
    t.string "account_id"
    t.string "post"
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.string "room_number"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "school_id"
    t.integer "event_id"
    t.integer "room_id"
    t.string "day"
    t.decimal "duration"
    t.string "start_time"
    t.string "end_time"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
  end

  create_table "teacher_accounts", force: :cascade do |t|
    t.integer "account_id"
    t.integer "teacher_id"
  end

  create_table "teacher_events", force: :cascade do |t|
    t.integer "school_id"
    t.integer "teacher_id"
    t.integer "event_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "school_id"
    t.string "first_name"
    t.string "last_name"
  end

  create_table "time_reports", force: :cascade do |t|
    t.integer "school_id"
    t.integer "teacher_id"
    t.string "event_name"
    t.decimal "time"
    t.decimal "rate"
    t.boolean "paid"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "school_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

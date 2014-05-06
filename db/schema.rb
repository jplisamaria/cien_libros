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

ActiveRecord::Schema.define(version: 20140505180246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "title",      null: false
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readings", force: true do |t|
    t.integer  "user_book_id"
    t.string   "amount_read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "readings", ["user_book_id"], name: "index_readings_on_user_book_id", using: :btree

  create_table "student_profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "grade_last_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_books", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_books", ["book_id"], name: "index_user_books_on_book_id", using: :btree
  add_index "user_books", ["user_id"], name: "index_user_books_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "password_digest", null: false
    t.string   "username",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "profile_id"
    t.string   "profile_type"
  end

  add_index "users", ["profile_id", "profile_type"], name: "index_users_on_profile_id_and_profile_type", using: :btree

end

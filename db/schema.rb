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

ActiveRecord::Schema.define(version: 20140527144811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "title",      null: false
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parent_profiles", force: true do |t|
    t.string   "first_name", default: "", null: false
    t.string   "last_name",  default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readings", force: true do |t|
    t.integer  "student_book_id"
    t.string   "amount_read"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "readings", ["student_book_id"], name: "index_readings_on_student_book_id", using: :btree

  create_table "student_books", force: true do |t|
    t.integer  "book_id"
    t.integer  "student_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "student_books", ["book_id"], name: "index_student_books_on_book_id", using: :btree
  add_index "student_books", ["student_profile_id"], name: "index_student_books_on_student_profile_id", using: :btree

  create_table "student_profiles", force: true do |t|
    t.string   "first_name",        default: "",    null: false
    t.string   "last_name",         default: "",    null: false
    t.string   "grade_last_year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_profile_id"
    t.boolean  "at_hernandez",      default: false, null: false
  end

  add_index "student_profiles", ["parent_profile_id"], name: "index_student_profiles_on_parent_profile_id", using: :btree

  create_table "teacher_profiles", force: true do |t|
    t.string   "first_name", default: "", null: false
    t.string   "last_name",  default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_student_relationships", force: true do |t|
    t.integer  "TeacherProfile_id"
    t.integer  "StudentProfile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teacher_student_relationships", ["StudentProfile_id"], name: "index_teacher_student_relationships_on_StudentProfile_id", using: :btree
  add_index "teacher_student_relationships", ["TeacherProfile_id"], name: "index_teacher_student_relationships_on_TeacherProfile_id", using: :btree

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
